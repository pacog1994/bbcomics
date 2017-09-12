<?php

include_once '../global.php';

// get the identifier for the page we want to load
$action = $_GET['action'];

// instantiate a ProductController and route it
$pc = new ProductController();
$pc->route($action);

class ProductController {

	// route us to the appropriate class method for this action
	public function route($action) {
		switch($action) {

			case 'addReview':
				$productID = $_GET['pid'];
				$this->addReview($productID);
				break;

			case 'viewProduct':
        $productID = $_GET['pid'];
				$this->viewProduct($productID);
				break;

			case 'editProduct':
        $productID = $_GET['pid'];
				$this->editProduct($productID);
				break;
      //
			case 'editProductProcess':
				$productID = $_GET['pid'];
				$this->editProductProcess($productID);
				break;

			case 'deleteProduct':
			$productID = $_GET['pid'];
			$this->deleteProduct($productID);
			break;

			case 'deleteProductProcess':
			$productID = $_GET['pid'];
			$this->deleteProductProcess($productID);
			break;

			case 'addProductProcess':
			$date = date('Y-m-d H:i:s');
			$title = $_POST['title'];
			$description = $_POST['description'];
			$quantity = $_POST['quantity'];
			$price = $_POST['price'];
			$img_url = $_POST['img_url'];
			$category = $_POST['category'];
			$p_type = $_POST['ptype'];
			$this->addProductProcess($date, $title, $description, $quantity, $price, $img_url, $category, $p_type);
			break;

			case 'addToCart':
			$productID = $_GET['pid'];
			$this->addToCart($productID);
			break;

      // redirect to home page if all else fails
      default:
        header('Location: '.BASE_URL);
        exit();
		}

	}


	public function addReview($productID) {
		session_start();

			$rating = $_POST['rating'];
			$review = $_POST['review'];
			$reviewerID = $_SESSION['userID']; // the logged-in user

			// create and save the new product review
			$nr = new Review(array(
			'rating' => $rating,
			'review' => $review,
			'reviewer_id' => $reviewerID,
			'product_id' => $productID
			));
			$nr->save();

			$e = new Event(array(
					'event_type_id' => EventType::getIdByName('reviewed_product'),
					'user_1_id' => $reviewerID,
					'product_1_id' => $productID
			));
			$e->save();
			// redirect us
			header('Location: '.BASE_URL.'/product/view/'.$productID);
			include_once SYSTEM_PATH.'/view/helpers.php';
			exit();
		}

		public function addToCart($productID) {
			session_start();
			$pageName = 'addToCart';
			$p = Product::loadbyId($productID);
			$buyID = $_SESSION['userID']; // the logged-in user

			// create and save the new product review
			$nc = new Cart(array(
			'buyer_id' => $buyID,
			'product_id' => $productID,
			'title' => $p->get('title'),
			'img-url' => $p->get('img_url')
			));
			$nc->save();

			//event for adding to cart
			$e = new Event(array(
					'event_type_id' => EventType::getIdByName('carted_product'),
					'user_1_id' => $buyID,
					'data_1' => $p->get('title')
			));
			$e->save();

			//$_SESSION['msg'] = "You edited the product called ".$title;

			include_once SYSTEM_PATH.'/view/header.tpl';
			include_once SYSTEM_PATH.'/view/product.tpl';
			include_once SYSTEM_PATH.'/view/footer.tpl';
		}
		
	public function viewProduct($id) {
		$pageName = 'Product';
		$p = Product::loadbyId($id);

		$reviews = Review::getReviewsByProductId($id);

		$conn = mysql_connect(DB_HOST, DB_USER, DB_PASS)
			or die ('Error: Could not connect to MySql database');
		mysql_select_db(DB_DATABASE);

		$q = sprintf("SELECT * FROM product WHERE id = %d; ",
			$id
			);
		$result = mysql_query($q);
		while($row = mysql_fetch_assoc($result)) {
			$product['title'] = $row['title'];
			$product['description'] = $row['description'];
			$product['quantity'] = $row['quantity'];
			$product['price'] = $row['price'];
			$product['img-url'] = $row['img-url'];
		}

		// if(isset($_SESSION['user'])) {
		// 	print"hallooooo";
		// }

		include_once SYSTEM_PATH.'/view/helpers.php';
		include_once SYSTEM_PATH.'/view/header.tpl';
		include_once SYSTEM_PATH.'/view/product.tpl';
		include_once SYSTEM_PATH.'/view/footer.tpl';
  }

	public function editProduct($id) {
		$pageName = 'edit';

		$host     = DB_HOST;
		$database = DB_DATABASE;
		$username = DB_USER;
		$password = DB_PASS;

		$conn = mysql_connect($host, $username, $password)
		or die ('Error: Could not connect to MySql database');

		mysql_select_db($database);

		$q = sprintf("SELECT * FROM product WHERE id = %d ",
		mysql_real_escape_string($id)
	);
	$result = mysql_query($q);

	$product = array();

	while($row = mysql_fetch_assoc($result)) {
		$product['title'] = $row['title'];
		$product['description'] = $row['description'];
		$product['price'] = $row['price'];
		$product['img_url'] = $row['img-url'];
		$product['category'] = $row['category'];
		$product['ptype'] = $row['ptype'];
		$product['quantity'] = $row['quantity'];
	}
		mysql_close($conn);
		include_once SYSTEM_PATH.'/view/header.tpl';
		include_once SYSTEM_PATH.'/view/editProduct.tpl';
		include_once SYSTEM_PATH.'/view/footer.tpl';
	}

	public function editProductProcess($id) {
		session_start();
		$title = $_POST['title'];
		$description = $_POST['description'];
		$quantity = $_POST['quantity'];
		$price = $_POST['price'];
		$img_url = $_POST['img_url'];
		$category = $_POST['category'];
		$p_type = $_POST['ptype'];

		$p = Product::loadById($id);
		$p->set('title', $title);
		$p->set('descripton', $description);
		$p->set('quantity', $quantity);
		$p->set('price', $price);
		$p->set('img_url', $img_url);
		$p->set('category', $category);
		$p->set('ptype', $p_type);
		$p->save();
		// connect to DATABASE FIRST
		$conn = mysql_connect(DB_HOST, DB_USER,DB_PASS)
			or die ('Error: Could not connect to MySql database');
				$q = sprintf("UPDATE product
				SET title = '%s', description = '%s', quantity = %d, price = %d,
				img_url = '%s', category = '%s', p_type = '%s'
				WHERE id = %d ",
				$title,
				$description,
				$quantity,
				$price,
				$img_url,
				$category,
				$p_type,
				$id
			);
			echo $q;
				$query = mysqli_query($conn, $q);
		$_SESSION['msg'] = "You edited the product called ".$title;
		header('Location: '.BASE_URL);
	}
	public function deleteProduct($id) {
		$pageName = 'delete';
		include_once SYSTEM_PATH.'/view/header.tpl';
		include_once SYSTEM_PATH.'/view/delete.tpl';
		include_once SYSTEM_PATH.'/view/footer.tpl';
	}

	public function deleteProductProcess($id) {
		session_start();
		// connect to DATABASE FIRST
		$conn = mysqli_connect(DB_HOST, DB_USER,DB_PASS, DB_DATABASE)
			or die ('Error: Could not connect to MySql database');

			$q = sprintf("DELETE FROM product WHERE id = '$id'");
			$query = mysqli_query($conn, $q);

			header('Location: '.BASE_URL);
	}

	public function addProductProcess($d, $t, $de, $q, $p, $i, $c, $p_t) {
		session_start();
		$adderID = $_SESSION['userID'];

		// $newArray = array (
		// 'id' => null,
		// 'title' => $t,
		// 'ptype' => $p_t,
		// 'category' => $c,
		// 'description' => $de,
		// 'price' => $p,
		// 'quantity' => $q,
		// 'img_url' =>  $i,
		// 'date_created' => $d,
		// 'creator_id' => $adderID
		// );
		$newProduct = new Product(array (
		'id' => null,
		'title' => $t,
		'ptype' => $p_t,
		'category' => $c,
		'description' => $de,
		'price' => $p,
		'quantity' => $q,
		'img_url' =>  $i,
		'date_created' => $d,
		'creator_id' => $adderID
		));



		if($t != null){

			// $newProduct->set($newArray);
			$newProduct->save();
			$e = new Event(array(
					'event_type_id' => EventType::getIdByName('add_product'),
					'user_1_id' => $adderID,
					'data_1' => $t
			));
			$e->save();
			header('Location: '. BASE_URL);
		}
		else {
			header('Location: '. BASE_URL);
		}
	}



}
