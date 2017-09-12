<div id="content" style="flex-direction: row"> <!-- content containter -->
  <div id="left-filter" style="height: 1000px; width: 500px; margin-left: 60px; background-color: transparent;
  box-shadow: none">
  <!-- font-size: 1.6rem font-size: 1.6rem;  font-size: 1.6rem; -->
  <!-- font-size: 1.6rem font-size: 1.6rem;  font-size: 1.6rem; font-size: 2rem;-->
    <h2 style="margin-left: 20px"><label style="color: green">Price: </label>&nbsp;&nbsp;<label style="color: blue;
      ">$<?= $p->get('price')?></label><br>
      <label style="color: green">Qty:</label>
      &nbsp;&nbsp;<b style="color: white; "><?= $p->get('quantity')?></b></h2>

    <label style="color: yellow; font-family: Arial Black; margin-left: 20px;">
      Overall Customer Rating:<br/></label>

    <p style="margin-left: 20px;"><image src="<?= BASE_URL ?>/public/images/ratingbarfilled.png"
      alt="ratingbar" height="50px" width="70%"/><label style="color: yellow;
      font-family: Arial Black;">10</label><label style="color: white;  font-family: Arial Black;">
        /10</label>
        <!-- height: 450px; -->
      <div id="review" style=" overflow-y:scroll;" ><label><b>Reviews:</b><label>
        <?php if($reviews == null): ?>

          <p>No reviews of this product yet.</p>

        <?php else: ?>

          <?php foreach($reviews as $review): ?>
            <?php

            $stars = '';

            // full stars
            for($i=0; $i<$review->get('rating'); $i++) {
              $stars .= '&#9733;';
            }

            // empty stars
            for($i=0; $i<(5 - $review->get('rating')); $i++) {
              $stars .= '&#9734;';
            }

            $username = User::getUsernameById($review->get('reviewer_id'));
            $followButton = getFollowButton($username);

            ?>
            <div class="review"><!--
              <?php if($_SESSION['user'] == $username): ?>
              <button style="font-size: 12px; width: 45px; height: 20px; background: none;border-radius:0px; display: inline; margin: 0px; float:right;">edit</button>
              <button style="font-size: 12px; width: 45px; height: 20px; background: none;border-radius:0px; display: inline;margin: 0px; float:right;">delete</button>
              <?php endif; ?>
-->
            	<p class="rating"><?= $stars ?></p>
            	<p class="review"><?= $review->get('review') ?></p>
            	<p class="details">Posted by <strong><?= $username.$followButton ?></strong> on <?= date("m-j-y g:i a", strtotime($review->get('date_created'))) ?></p>
            </div>

          <?php endforeach; ?>
        <?php endif; ?>

        <?php if(isset($_SESSION['user'])): ?>
        <h2>Your review</h2>
        <form method="POST" action="<?= BASE_URL ?>/product/view/<?= $p->get('id') ?>/review/">
        	<label class="review">
            <p style="font-size: 16px; display: inline; ">Rating:</p>
        	<select name="rating" >
        		<option value="0">0 stars (worst)</option>
        		<option value="1">1 star</option>
        		<option value="2">2 stars</option>
        		<option value="3">3 stars</option>
        		<option value="4">4 stars</option>
        		<option value="5">5 stars (best)</option>
        	</select></br>
        	</label>

        	<label class="review">
            <p style="font-size: 16px;display: inline;">Review:</p>
        		<textarea name="review"></textarea>
        	</label>
        	<input type="submit" name="submit" value="Post Review">
        </form>
        <?php endif; ?>
          </div>
        </div>
        <a href="<?= BASE_URL ?>/product/view/<?= $p->get('id') ?>/addToCart/"><button class = "setButton">Add to Cart</button></a>
          <div id="right-content">
            <?php if(isset($_SESSION['user'])) {
              $username = $_SESSION['user'];
              $user = User::loadByUsername($username);
              $userrole = $user->get('role');
              if($userrole == "admin" || $user->get('id') == $p->get('creator_id'))  { ?>

                <a href="<?= BASE_URL.'/product/edit/view/'.$p->get('id')?>"><button class="setButton">Edit</button></a>
              <a href="<?= BASE_URL.'/product/delete/view/'.$p->get('id')?>"><button class="setButton">Delete</button></a>

              <!-- <ul id="editable">
                <li><a href="<?= BASE_URL.'/product/edit/view/'.$p->get('id')?>"><button class="setButton">Edit</button></li></a>
                <li><a href="<?= BASE_URL.'/product/delete/view/'.$p->get('id')?>"><button class="setButton">Delete</button></li></a>
              </ul> -->
              <br>
              <?php }
            } ?>

            <div id="top-content">

              <div id="featured" style="float: none;  width: 60%; margin: 40px auto">
                <figure class="imgdec"><a href="#"><img src="<?= BASE_URL.'/public/images/'.$p->get('img_url') ?>"; alt="<?= $p->get('title') ?>" /></a></figure>
              </div>
            </div>
            <div id="synopsis-box">
              <h2 style="text-align: center; font-family: Helvetica; text-decoration: underline;"><?= $p->get('title') ?></h2>
              <p><b>Genre:</b> Horror | Action | Thriller | Drama<br/><b>Published:</b> 2003</p>
              <p><b>Overview:</b> <?= $p->get('description') ?> </p>

              <!--Credit to thewalkingdead.com for the information on the walking dead-->
            </div>
          </div>
        </div> <!--end of div id="content" -->
