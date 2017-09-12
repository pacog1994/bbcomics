<div id="content" style="flex-direction: row; height: 800px"> <!-- content containter -->



    <form id="add-product" action="<?= BASE_URL ?>/product/add/view/process" method="POST">
          <h2 style="color: white; font-size: 36px; text-align: center">Add Product</h2>
      <ul>
        <li><label>Title: <input type="text" name="title" placeholder="Enter Title"></label></li>

        <li><label>Description: <textarea name="description" placeholder="Enter Description"></textarea></label></li>

        <li><label>Price ($): <input type="text" name="price" placeholder="Enter Price"></label></li>

        <li><label>Image URL: <input type="text" name="img_url" placeholder="Enter Image URL"></label></li>

        <li><label>Category: <input type="text" name="category" placeholder="Enter Category"></label></li>

        <li><label>Product Type: <input type="text" name="ptype" placeholder="Enter Type"></label></li>

        <li><label>Quantity: <input type="text" name="quantity" placeholder="How Many?"></label></li>

        <li><input type="submit" name="submit" value="Add Item"></li>
      </ul>
    </form>

</div>
