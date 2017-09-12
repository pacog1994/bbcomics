<?php

include_once '../global.php';

$action = $_GET['action'];
$pc = new SiteController();
$pc->route($action);

class SiteController {

	// route us to the appropriate class method for this action
	public function route($action) {
		switch($action) {
			//navigate to home
			case 'home':
			$this->home();
			break;
			//Navigate to browse
			case 'browse':
			$this->browse();
			break;
			//navigate to add
			case 'sell':
			$this->sell();
			break;
			//navigate to walkingDead page
			case 'walkingdead':
			$this->walkingdead();
			break;
			//activate login function
			case 'login':
						$this->login();
						break;
			//logs user out
			case 'logout':
						$this->logout();
						break;
			//Procresses the login function
			case 'processLogin':
				$username = $_POST['un'];
				$password = $_POST['pw'];
				$this->processLogin($username, $password);
				break;

				//Navigate to deletePage
			case 'deleteUser':
				$idGet = $_GET['id'];
				$this->deleteUser($idGet);
			break;
			//Delete the user
			case 'deleteUserProcess':
				$idGet = $_GET['id'];
				$this->deleteUserProcess($idGet);
			break;

				case 'signed':
				$this->signed();
				break;

			case 'signup':
				$this->signup();
				break;

				//Checks if user is right
				case 'checkUsername':
				$username = $_GET['username'];
				$this->checkUsername($username);
				break;

				case 'follow':
					$username = $_POST['username'];
					$this->follow($username);
					break;

					//Navigates to profile
				case 'profile':
					// $username = $_GET['username'];
					$this->profile();
					break;

					//Allows the selection of the other settings
					case 'settingChanges':
					$idPost = $_GET['id'];
					$firstNamePost = $_POST['firstName'];
					$lastNamePost = $_POST['lastName'];
					$passwordPost = $_POST['password'];
					$emailPost = $_POST['email'];
					$this->settingChanges($idPost, $passwordPost, $firstNamePost,
					$lastNamePost, $emailPost);
					break;
					//Allows the selection of the gender
					case 'genderSelect':
				$id = $_GET['id'];
				$gender = $_POST['gender'];
				$this->genderSelect($id, $gender);
				break;
				//Allows the selection of the gender
				case 'descriptionSelect':
			$id = $_GET['id'];
			$descriptionPost = $_POST['description'];
			$this->descriptionSelect($id, $descriptionPost);
			break;

			//CART CASES
			case 'cart':
				// $username = $_GET['username'];
				session_start();
				$buyer = $_SESSION['userID'];
				$this->cart($buyer);
				break;

				case 'checkout':
				$this->checkout();
				break;

			case 'checkoutProcess':
				// $username = $_GET['username'];
				session_start();
				$buyer = $_SESSION['userID'];
				$this->checkoutProcess($buyer);
				break;

				case 'remove':
									// $username = $_GET['username'];
									session_start();
									$buyer = $_SESSION['userID'];
									$productID = $_GET['pid'];
									$this->remove($productID, $buyer);
									break;
			// redirect to home page if all else fails
			default:
			header('Location: '.BASE_URL);
			exit();

		}

	}

	public function home() {
		$pageName = 'Home';
		session_start();
		if(isset($_SESSION['userID'])) {
			$events = Event::getEventsByUserId($_SESSION['userID']);
			$reviewerID = $_SESSION['userID'];
			//print("wowoow");
			//print($reviewerID);
		}

		$aID = $_SESSION['userID'];

		$con = mysql_connect(DB_HOST, DB_USER, DB_PASS)
		or die ('Error: Could not connect to MySql database');
		mysql_select_db(DB_DATABASE);

		$added = sprintf("SELECT * FROM product WHERE creator_id = '$aID' ;");
		$addedResult = mysql_query($added);
		$addedResult2 = $addedResult;
		$length = count($addedResult);
		for ($i = 0; $i < $length; $i++) {
  	$addID[$i] = $addedResult[$i];
		}
		include_once SYSTEM_PATH.'/view/helpers.php';
		include_once SYSTEM_PATH.'/view/header.tpl';
		include_once SYSTEM_PATH. '/view/home.tpl';
		include_once SYSTEM_PATH.'/view/footer.tpl';

	}

	public function browse() {
		$pageName = 'Browse';
		$con = mysql_connect(DB_HOST, DB_USER, DB_PASS)
		or die ('Error: Could not connect to MySql database');
		mysql_select_db(DB_DATABASE);

		$q = sprintf("SELECT * FROM product WHERE ptype ='new' ;");
		$newresult = mysql_query($q);

		$r = sprintf("SELECT * FROM product WHERE ptype ='hot' ;");
		$hotresult = mysql_query($r);

		$s = sprintf("SELECT * FROM product WHERE ptype ='recommended' ;");
		$recresult = mysql_query($s);

		$t = sprintf("SELECT * FROM product WHERE ptype ='featured' ;");
		$fearesult = mysql_query($t);
		include_once SYSTEM_PATH. '/view/header.tpl';
		include_once SYSTEM_PATH. '/view/browse.tpl';
		include_once SYSTEM_PATH. '/view/footer.tpl';
	}
	public function login() {
		$pageName = 'login';
		include_once SYSTEM_PATH. '/view/header.tpl';
		include_once SYSTEM_PATH. '/view/login.tpl';
		include_once SYSTEM_PATH. '/view/footer.tpl';
	}
	public function sell() {
		$pageName = 'Sell';
		include_once SYSTEM_PATH. '/view/header.tpl';
		include_once SYSTEM_PATH. '/view/sellandtrade.tpl';
		include_once SYSTEM_PATH. '/view/footer.tpl';
	}

	public function walkingdead() {
		$pageName = 'Walkingdead';

		$con = mysql_connect(DB_HOST, DB_USER, DB_PASS)
		or die ('Error: Could not connect to MySql database');
		mysql_select_db(DB_DATABASE);

		$u = sprintf("SELECT * FROM product WHERE ptype ='new' AND category = 'walkingdead';");
		$wnewresult = mysql_query($u);

		$v = sprintf("SELECT * FROM product WHERE ptype ='hot' AND category = 'walkingdead';");
		$whotresult = mysql_query($v);

		$w = sprintf("SELECT * FROM product WHERE ptype ='recommended' AND category = 'walkingdead';");
		$wrecresult = mysql_query($w);

		$x = sprintf("SELECT * FROM product WHERE ptype ='featured' AND category = 'walkingdead';");
		$wfearesult = mysql_query($x);
		include_once SYSTEM_PATH. '/view/header.tpl';
		include_once SYSTEM_PATH. '/view/walkingdead.tpl';
		include_once SYSTEM_PATH. '/view/footer.tpl';
	}
	public function signup() {
		$pageName = 'Signup';
		include_once SYSTEM_PATH.'/view/header.tpl';
		include_once SYSTEM_PATH.'/view/signup.tpl';
		include_once SYSTEM_PATH.'/view/footer.tpl';
	}

  public function logout() {
				session_start();
        session_destroy(); // for good measure
        // redirect to home page
				header('Location: '.BASE_URL);
				exit();
  }


	public function processLogin($u, $p) {
		session_start();
		$con = mysqli_connect(DB_HOST, DB_USER,DB_PASS, DB_DATABASE)
		or die ('Error: Could not connect to MySql database');

		$qy = sprintf("SELECT * FROM user WHERE username='$u' AND pw='$p' ;");
		$q = mysqli_query($con, $qy);

		if ($row = mysqli_fetch_assoc($q)) {
			$_SESSION['user'] = $row['username'];
			$_SESSION['userID'] = $row['id'];
			header('Location: '.BASE_URL);
			exit();
		}
		elseif((($u == $adminUsername) && ($p == $adminPassword))) {
			$_SESSION['user'] = $u;
			$_SESSION['userID'] = $row['id'];
			header('Location: '.BASE_URL);
			exit();
		} else {
			// send them back
			// session_destroy();
			header('Location: '.BASE_URL);
			exit();
		}
	}

		public function signed() {
		session_start();
		$username = $_POST['username'];
		$password = $_POST['pw'];
		$confirm = $_POST['confirmpw'];
		$email = $_POST['email'];
		$first_name = $_POST['first_name'];
		$last_name = $_POST['last_name'];
		$role = $_POST['role'];

		$mysql = sprintf("INSERT INTO user (username, pw, first_name, last_name, email, role)
		VALUES ('$username', '$password', '$first_name', '$last_name', '$email', '$role');");
		$con = mysqli_connect(DB_HOST, DB_USER,DB_PASS, DB_DATABASE)
		or die ('Error: Could not connect to MYSQL database');
		$q = mysqli_query($con, $mysql);

		$_SESSION['user'] = $username;
		header('Location: '.BASE_URL);
		exit();
	}

	public function checkUsername($username) {
		$user = User::loadByUsername($username);
		if($user == null) {
			// user doesn't exist; username is available
			$json = array( 'status' => 'available' );
		} else {
			// username not available
			$json = array( 'status' => 'unavailable' );
		}

		header('Content-Type: application/json');
		echo json_encode($json);
	}


	public function follow($followeeUsername) {
		session_start();
	// 	if(!isset($_SESSION['user'])) {
	// 	 // user isn't logged in, so can't follow anyone
	// 	 $json = array('error' => 'You are not logged in.');
	// 	 echo json_encode($json);
	//  } else {
		 // user is logged in
		 // get user ID for followee
		 $followee = User::loadByUsername($followeeUsername);

		 // does this follow already exist?
		 $f = Follow::loadByUsernames($_SESSION['user'], $followeeUsername);
		 if($f != null) {
			 // follow already happened!
			 $json = array('error' => 'You already followed this user.');
			 echo json_encode($json);
		 }

			// save the new follow
			$f = new Follow(array(
				'follower_id' => $_SESSION['userID'],
				'followee_id' => $followee->get('id')
				));
			$f->save();
			// we're done
			$json = array('success' => 'success');

			// events
			$e = new Event(array(
					'event_type_id' => EventType::getIdByName('follow_user'),
					'user_1_id' => $_SESSION['userID'],
					'user_2_id' => $followee->get('id')
			));
			$e->save();

			echo json_encode($json);
		//}
	}

	public function profile() {
		/*gives name to page path*/

		$pageName = 'Profile';

		include_once SYSTEM_PATH.'/view/helpers.php';
		include_once SYSTEM_PATH.'/view/header.tpl';
		include_once SYSTEM_PATH.'/view/profile.tpl';
		include_once SYSTEM_PATH.'/view/footer.tpl';
		}
		//Transfer to delete tpl
	public function deleteUser($idStored) {
		$pageName = 'deleteUser';
		include_once SYSTEM_PATH.'/view/header.tpl';
		include_once SYSTEM_PATH.'/view/deleteUser.tpl';
		include_once SYSTEM_PATH.'/view/footer.tpl';

	}
	//Delete user
	public function deleteUserProcess($id) {
		session_start();
		// connect to DATABASE FIRST
		$conn = mysqli_connect(DB_HOST, DB_USER,DB_PASS, DB_DATABASE)
			or die ('Error: Could not connect to MySql database');

			$q = sprintf("DELETE FROM user WHERE id = '$id'");
			$query = mysqli_query($conn, $q);
			session_destroy();
			header('Location: '.BASE_URL);
	}

		public function cart($bID) {
			/*gives name to page path*/
			$pageName = 'Cart';

			$con = mysql_connect(DB_HOST, DB_USER, DB_PASS)
			or die ('Error: Could not connect to MySql database');
			mysql_select_db(DB_DATABASE);

			$cart = sprintf("SELECT * FROM cart WHERE buyer_id = '$bID' ;");
			$cartResult = mysql_query($cart);
			//$buyerResult = mysql_query($cart);

			// $prodResult = sprintf("SELECT * FROM product WHERE id = '$buyerResult['product_id']' ;");
			// $cartResult = mysql_query($prodResult);

			//$cartResult = Product::loadById($cart['product_id']);


			include_once SYSTEM_PATH.'/view/header.tpl';
			include_once SYSTEM_PATH.'/view/cart.tpl';
			include_once SYSTEM_PATH.'/view/footer.tpl';
			}
		//Changes gender
		public function genderSelect($id, $gender) {
		$user = User::loadById($id);
		$user->set('gender', $gender);
		$user->save();
		header('Location: '.BASE_URL.'/Profile');
	}
	//Changes pass, first last name, email
		public function settingChanges($idRetrieved, $pwStored, $firstNameStored,
		$lastNameStored, $emailStored) {
			$user = User::loadById($idRetrieved);
			if ($pwStored != "") {
			$user->set('pw', $pwStored);
			}
			if ($firstNameStored != "") {
			$user->set('first_name', $firstNameStored);
			}
			if ($lastNameStored != "") {
			$user->set('last_name', $lastNameStored);
			}
			if ($emailStored != "") {
			$user->set('email', $emailStored);
			}
			$user->save();
			header('Location: '. BASE_URL.'/Profile');
		}
		//Description Change
		public function descriptionSelect($id, $descriptionStored) {
		$user = User::loadById($id);
		$user->set('description', $descriptionStored);
		$user->save();
		header('Location: '.BASE_URL.'/Profile');
	}

	public function checkout() {
				$pageName = 'checkout';
				include_once SYSTEM_PATH.'/view/header.tpl';
				include_once SYSTEM_PATH.'/view/checkout.tpl';
				include_once SYSTEM_PATH.'/view/footer.tpl';
			}

		public function checkoutProcess($buyerID) {
			session_start();
			// connect to DATABASE FIRST
			$conn = mysqli_connect(DB_HOST, DB_USER,DB_PASS, DB_DATABASE)
				or die ('Error: Could not connect to MySql database');

				$q = sprintf("DELETE  FROM cart WHERE buyer_id = '$buyerID' ;");
				$query = mysqli_query($conn, $q);

				header('Location: '.BASE_URL);
		}

		public function remove($prodID, $buyerID) {
			session_start();
			// connect to DATABASE FIRST
			$conn = mysqli_connect(DB_HOST, DB_USER,DB_PASS, DB_DATABASE)
				or die ('Error: Could not connect to MySql database');

				$q = sprintf("DELETE FROM cart WHERE product_id = '$prodID' && buyer_id ='$buyerID' ;");
				$query = mysqli_query($conn, $q);

				header('Location: '.BASE_URL);
		}
}
