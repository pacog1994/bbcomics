<div class="gallery-name">
  <h1 class="new"> Cart </h1>
</div>
<ul class="gallery">
  <a id="checkout" href="<?= BASE_URL ?>/cart/checkout/"><button class = "setButton">Checkout</button></a>


  <?php while($row = mysql_fetch_assoc($cartResult)): ?>
    <li class="product"><div class="gallery-item new-img">
      <!--Credit to theamazingnerd.files.wordpress.com-->
      <figure class="imgdec">
        <a href="<?=BASE_URL?>/product/view/<?=$row['product_id'] ?>">
          <img src="<?=BASE_URL?>/public/images/<?=$row['img-url']?>"; alt="<?= $row['title'] ?>"/>
        </a></figure>

      </div></li>
      <a href="<?=BASE_URL?>/cart/remove/<?=$row['product_id'] ?>"><button class="setButton">Remove</button></a>
    <?php endwhile; ?>

  </ul>
