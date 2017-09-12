<ul id="filter-nav">
            <li><label><input type="checkbox" name="checkbox"; value="new"; style="border:5px solid #aaaaaa"/>New</label></li>
            <li><label><input type="checkbox" name="checkbox"; value="hot"; style="border:5px solid #aaaaaa"/>Hot</label></li>
            <li><label><input type="checkbox" name="checkbox"; value="recommended"; style="border:5px solid #aaaaaa"/>Recommended</label></li>
            <li><label><input type="checkbox" name="checkbox"; value="featured"; style="border:5px solid #aaaaaa"/>Featured</label></li>
</ul>

<div id="content"> <!-- content containter -->
    <div id="top-content">
      <div id="featured" style="float: none; margin: 40px auto">
        <figure class="imgdec"><a href="<?= BASE_URL ?>/Walkingdead/"><img src="http://www.1001tv.fr/files/2016/05/the-walking-dead-comic.jpg"; alt="WD-comic" /></a></figure> <!--Credit to 1001.tv.fr-->
        <h2><span>The Walking Dead</span></h2>
      </div>
      </div>
      <div id="mid-content"> <!--displays all the comics to be browsed/bought -->
        <div class="gallery-name">
          <h1 class="new"> NEW </h1>
        </div>
        <ul class="gallery">
          <?php while($row = mysql_fetch_assoc($newresult)): ?>
            <li class="product"><div class="gallery-item new-img">
              <!--Credit to theamazingnerd.files.wordpress.com-->
              <figure class="imgdec">
                <a href="<?=BASE_URL?>/product/view/<?=$row['id'] ?>">
                  <img src="<?=BASE_URL?>/public/images/<?=$row['img-url']?>"; alt="<?= $row['title'] ?>"/>
                </a></figure>
                <h2 class="new"><span>NEW</span></h2>
              </div></li>
            <?php endwhile; ?>
          </ul>

          <div class="gallery-name"> 																												<!--- HOT COMICS -->
            <h1 class="hot"> HOT </h1>
          </div>
          <ul class="gallery">
            <?php while($row = mysql_fetch_assoc($hotresult)): ?>
              <li><div class="gallery-item hot-img" >
                <!--Next 12 images are credited to coverbrowser.com -->
                <figure class="imgdec"><a href="<?=BASE_URL?>/product/view/<?=$row['id'] ?>">
                  <img  src="<?=BASE_URL?>/public/images/<?=$row['img-url']?>"; alt="<?= $row['title'] ?>"/></a></figure>
                <h2 class="hot"><span>HOT</span></h2>
              </div></li>
            <?php endwhile; ?>
          </ul>

          <div class="gallery-name"> 																												<!-- RECOMMENDED COMICS -->
            <h1 class="recommended"> RECOMMENDED </h1>
          </div>
          <ul class="gallery">
            <?php while($row = mysql_fetch_assoc($recresult)): ?>
              <li><div class="gallery-item rec-img">
                <figure class="imgdec"><a href="<?=BASE_URL?>/product/view/<?=$row['id'] ?>">
                  <img  src="<?=BASE_URL?>/public/images/<?=$row['img-url']?>"; alt="<?= $row['title'] ?>"/></a></figure>
                <h2 class="recommended" id="fix-gi"><span>RECOMMENDED</span></h2>
              </div></li>
            <?php endwhile; ?>
          </ul>

          <div class="gallery-name">																												<!-- FEATURED COMICS -->
            <h1 class="featured">FEATURED</h1>
          </div>
          <ul class="gallery">
            <?php while($row = mysql_fetch_assoc($fearesult)): ?>
              <li><div class="gallery-item fea-img">
                <figure class="imgdec"><a href="<?=BASE_URL?>/product/view/<?=$row['id'] ?>">
                  <img  src="<?=BASE_URL?>/public/images/<?=$row['img-url']?>"; alt="<?= $row['title'] ?>"/></a></figure>
                <h2 class="featured"><span>FEATURED</span></h2>
              </div></li>
            <?php endwhile; ?>
          </ul>

    </div>
</div>
