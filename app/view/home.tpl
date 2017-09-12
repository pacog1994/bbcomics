<div id="content"> <!-- content containter -->
  <div id="top-content">
    <div id="featured">
      <figure class="imgdec"><a href="<?= BASE_URL ?>/Walkingdead/"><img src="<?=BASE_URL ?>/public/images/WDComic.jpg"; alt="WD-comic" /></a></figure> <!--Credit to 1001.tv.fr-->
      <h2><span>The Walking Dead</span></h2>
    </div>
  </div>
  <?php if(isset($_SESSION['user'])) {
    $userSession = $_SESSION['user'];
    $user = User::loadByUsername($userSession);
    echo '
      <span id="personalfeed">'.$_SESSION['user'].'s newsfeed</span>
      <div id="newsfeed">';
     }
     else {
       echo '<a id="signup-suggestion" href="'.BASE_URL.'/Signup">Sign Up Here!</a>';
       } ?>
    <?php if(isset($events)): ?>
    <h2>Recent Activity</h2>

      <?php if(count($events) == 0): ?>
    <p>No recent activity.</p>
      <?php else: ?>

    <ul>
      <?php foreach($events as $event): ?>
        <li><?= formatEvent($event) ?></li>
      <?php endforeach; ?>
    </ul>

      <?php endif; ?>

    <?php endif; ?>

    </div>

  </div>
</div>
  <div id="outer-modal" class = "modal">
    <div class ="modal-content">
      <span class="close">x</span>
      <label>Title:</label>
        <br>
        <form id="edit-product" action="<?= BASE_URL ?>/product/edit/view/1" method="POST">
        <input type="text" name="title" placeholder = "Enter Title">
        <br>
        <label>Price</label>
        <br>
        <input type="text" name="price" placeholder = "Enter Price">
        <br>
        <button id = "sub">Save</button>
        </form>
    </div>
  </div>
</div>

<?php if(isset($_SESSION['user'])): ?>
    <div id="comicpage">
      <?xml version="1.0" encoding="utf-8"?>
      <!-- Generator: Adobe Illustrator 19.0.0, SVG Export Plug-In . SVG Version: 6.00 Build 0)  -->
      <svg version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
         viewBox="0 0 612 792" style="enable-background:new 0 0 612 792;" xml:space="preserve">
      <style type="text/css">
        .st0{stroke:#000000;stroke-width:2;stroke-miterlimit:10;}
        .st1{fill:#FFFFFF;stroke:#000000;stroke-width:2;stroke-miterlimit:10;}
        .st0:hover{fill-opacity:0.8;}
      </style>
      <defs>
        <?php
        $count = 0;
        while($row = mysql_fetch_assoc($addedResult) AND $count < 6): ?>
        <?php if($count == 0):
          echo '$count'; ?>
        <pattern id="img1" patternUnits="userSpaceOnUse"  width="100%" height="100%">
          <image xlink:href="<?=BASE_URL ?>/public/images/<?=$row['img-url']?>" x="24.5" y="22.2" width="276.5" height="211" />
        </pattern>
      <?php endif; ?>
        <?php if($count == 1):
          echo '$count'; ?>
        <pattern id="img2" patternUnits="userSpaceOnUse" width="100%" height="100%">
          <image xlink:href="<?=BASE_URL ?>/public/images/<?=$row['img-url']?>" x="310.5" y="22.2" width="276.5" height="211" />
        </pattern>
      <?php endif; ?>
          <?php if($count == 2):
            echo '$count';?>
        <pattern id="img3" patternUnits="userSpaceOnUse" width="100%" height="100%">
          <image xlink:href="<?=BASE_URL ?>/public/images/<?=$row['img-url']?>" x="24.7" y="243.9" width="562.6" height="278.7"/>
        </pattern>
      <?php endif; ?>
          <?php if($count == 3):
            echo '$count'; ?>
        <pattern id="img4" patternUnits="userSpaceOnUse" width="100%" height="100%">
          <image xlink:href="<?=BASE_URL ?>/public/images/<?=$row['img-url']?>" x="24.7" y="533" width="178.9" height="236.8"/>
        </pattern>
      <?php endif;  ?>
          <?php if($count == 4):
            echo '$count'; ?>
        <pattern id="img5" patternUnits="userSpaceOnUse" width="100%" height="100%">
          <image xlink:href="<?=BASE_URL ?>/public/images/<?=$row['img-url']?>"  x="216.5" y="533" width="178.9" height="236.8"/>
        </pattern>
      <?php endif; ?>
          <?php if($count == 5):
            echo '$count'; ?>
        <pattern id="img6" patternUnits="userSpaceOnUse" width="100%" height="100%">
          <image xlink:href="<?=BASE_URL ?>/public/images/<?=$row['img-url']?>" x="408.4" y="533" width="178.9" height="236.8"/>
        </pattern>
      <?php endif; ?>
      <?php
      $count = $count + 1;
      endwhile; ?>
</defs>
      <g id="Layer_1">
        <polygon id="XMLID_0_" class="st1" points="597,778.5 16.4,778.5 15,13.5 595.6,13.5 	"/>
      </g>
      <?php
      $count = 0;
      while($row = mysql_fetch_assoc($addedResult2) AND $count < 6): ?>
      <?php if($count == 0):
        echo '$count'; ?>
      <g id="top">
        <!-- <a href="<?=BASE_URL?>/product/edit/view/<?= $row['pid']?>"> -->
          <rect id="XMLID_1_" fill="url(#img1)" x="24.5" y="22.2" class="st0" width="276.5" height="211"/>
        <!-- </a> -->
      <?php endif; ?>
        <?php if($count == 1):
          echo '$count'; ?>
        <!-- <a href="<?=BASE_URL?>/product/view/1"> -->
          <rect id="XMLID_2_" fill="url(#img2)" x="310.5" y="22.2" class="st0" width="276.5" height="211"/>
        <!-- </a> -->
      </g>
      <g id="mid">
      <?php endif; ?>
          <?php if($count == 2):
            echo '$count';?>
        <!-- <a href="<?=BASE_URL?>/product/view/1"> -->
          <rect id="XMLID_3_" fill="url(#img3)" x="24.7" y="243.9" class="st0" width="562.6" height="278.7" />
        <!-- </a> -->
      </g>
      <g id="bot">
      <?php endif; ?>
          <?php if($count == 2):
            echo '$count';?>
        <!-- <a href="<?=BASE_URL?>/product/view/1"> -->
          <rect id="XMLID_4_" fill="url(#img4)" x="24.7" y="533" class="st0" width="178.9" height="236.8"/>
        <?php endif; ?>
            <?php if($count == 3):
              echo '$count'; ?>
          <rect id="XMLID_5_" fill="url(#img5)" x="216.5" y="533" class="st0" width="178.9" height="236.8"/>
        <!-- </a> -->
      <?php endif;  ?>
          <?php if($count == 4):
            echo '$count'; ?>
        <!-- <a href="<?=BASE_URL?>/product/view/1"> -->
        <rect id="XMLID_6_" fill="url(#img6)" x="408.4" y="533" class="st0" width="178.9" height="236.8"/>
      <!-- </a> -->
    <?php endif; ?>
        <?php if($count == 5):
          echo '$count'; ?>
      </g>
    <?php endif; ?>
    <?php
    $count = $count + 1;
    endwhile; ?>
      </svg>
    </div>
<?php endif; ?>
