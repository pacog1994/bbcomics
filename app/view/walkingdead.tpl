<ul id="filter-nav">
            <li><label><input type="checkbox" name="checkbox"; value="new"; style="border:5px solid #aaaaaa"/>New</label></li>
            <li><label><input type="checkbox" name="checkbox"; value="hot"; style="border:5px solid #aaaaaa"/>Hot</label></li>
            <li><label><input type="checkbox" name="checkbox"; value="recommended"; style="border:5px solid #aaaaaa"/>Recommended</label></li>
            <li><label><input type="checkbox" name="checkbox"; value="featured"; style="border:5px solid #aaaaaa"/>Featured</label></li>
</ul>


<div id="content" style="flex-direction: row"> <!-- content containter -->
  <div id="left-filter" style="height: 800px; width: 500px;">
    <h2 style="text-align: center; font-family: Helvetica; text-decoration: underline;">The Walking Dead</h2>
    <p><b>Genre:</b> Horror | Action | Thriller | Drama<br/><b>Published:</b> 2003</p>
    <p><b>Overview:</b> An epidemic of apocalyptic proportions has swept the globe, causing the dead to rise and feed on the living. In a matter of months, society has crumbled: There is no government, no grocery stores, no mail delivery, no cable TV. Rick Grimes finds himself one of the few survivors in this terrifying future. A couple months ago he was a small town cop who had never fired a shot and only ever saw one dead body. Separated from his family, he must now sort through all the death and confusion to try and find his wife and son. In a world ruled by the dead, we are forced to finally begin living. </p>

                                                                                        <!--Credit to thewalkingdead.com for the information on the walking dead-->
    <div id="review"><label><b>Reviews:</b><label>
        <p>
        <image src="<?= BASE_URL ?>/public/images/ratingbarfilled.png" alt="ratingbar" height="30%" width="30%"/>    10/10<br/>
        The Walking Dead is such a rush! Rick is my favorite character.<br/><b>Submitted by:</b> rickxoxo13<br/>
        </p>
        <p>
        <image src="<?= BASE_URL ?>/public/images/ratingbar.png" alt="ratingbar" height="30%" width="30%"/>    0/10<br/>
        I'm not a fan of this book series. I just came here to give it a bad rating<br/><b>Submitted by:</b> nettroll<br/>
        </p>
    </div>
  </div>
  <div id="right-content">
    <div id="top-content">
      <div id="featured" style="float: none; margin: 40px auto">
        <figure class="imgdec"><a href="">
          <img src="http://www.1001tv.fr/files/2016/05/the-walking-dead-comic.jpg"; alt="WD-comic" /></a></figure> <!--Credit to 1001.tv.fr-->
        <h2><span>The Walking Dead</span></h2>
      </div>
      </div>
      <div id="mid-content"> <!--displays all the comics to be browsed/bought -->
        <div class="gallery-name">
          <h1 class="new"> NEW </h1>
        </div>
        <ul class="gallery">
        <?php while($row = mysql_fetch_assoc($wnewresult)): ?>
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
            <?php while($row = mysql_fetch_assoc($whotresult)): ?>
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
            <?php while($row = mysql_fetch_assoc($wrecresult)): ?>
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
            <?php while($row = mysql_fetch_assoc($wfearesult)): ?>
              <li><div class="gallery-item fea-img">
                <figure class="imgdec"><a href="<?=BASE_URL?>/product/view/<?=$row['id'] ?>">
                  <img  src="<?=BASE_URL?>/public/images/<?=$row['img-url']?>"; alt="<?= $row['title'] ?>"/></a></figure>
                <h2 class="featured"><span>FEATURED</span></h2>
              </div></li>
            <?php endwhile; ?>
          </ul>
    </div>
  </div>
</div>
