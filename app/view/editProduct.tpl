<div id="content">

  <h2 style="color: white; font-size: 36px; text-align: center">Edit Product</h2>

  <form id="edit-product" action="<?= BASE_URL ?>/product/edit/view/<?= $id ?>/process/" method="POST">

    <ul>
      <li><label>Title: <input type="text" name="title" value="<?= $product['title'] ?>"></label></li>

      <li><label>Description: <textarea name="description"> <?= $product['description'] ?></textarea></label></li>

      <li><label>Price ($): <input type="text" name="price" value="<?= $product['price'] ?>"></label></li>

      <li><label>Image URL: <input type="text" name="img_url" value="<?= $product['img_url'] ?>"></label></li>

      <li><label>Category: <input type="text" name="category" value="<?= $product['category'] ?>"></label></li>

      <li><label>Product Type: <input type="text" name="ptype" value="<?= $product['ptype'] ?>"></label></li>

      <li><label>Quantity: <input type="text" name="quantity" value="<?= $product['quantity'] ?>"></label></li>

      <li><input type="submit" name="submit" value="Save Changes"></li>
    </ul>
  </form>

</div>
