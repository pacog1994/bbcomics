
<?php
session_start();
function isSelected($pn, $link) {
	if($pn == $link) {
		return ' id="selected-nav" ';
	}
}

?>

<!DOCTYPE html>
<!--
Created by: Carlos "Paco" Gallegos
Date Created: 9/10/2015
CS3744
-->
<html lang = "en">
<head>
	<meta charset="utf-8">
	<meta name="bbcomics home page" content="Blacksburg's coolest comic bookstore. Ton of varieties!">
	<title> BBComic | <?= $pageName ?></title>
	<link rel ="stylesheet" type="text/css" href="<?= BASE_URL ?>/public/css/style.css">
	<script type="text/javascript" src="<?= BASE_URL ?>/public/js/jquery-3.1.1.min.js"></script>
	<script type="text/javascript">
			var baseURL = '<?= BASE_URL ?>';
		</script>
	<script type="text/javascript" src="<?= BASE_URL ?>/public/js/scripts.js"></script>
	<script type="text/javascript" src="<?= BASE_URL ?>/public/js/loginScript.js"></script>
	<?php if($pageName == 'Signup'): ?>
	<script type="text/javascript" src="<?= BASE_URL ?>/public/js/signup.js"></script>
<?php endif; ?>
</head>
<!-- Content -->
<body>
	<div id="wrapper">
		<div id="header">
			<div id="banner"><a  <?= isSelected($pageName, 'Home') ?> href="<?= BASE_URL ?>/"><h1 align="center">BB Comics</h1></a></div>
			<div id="options-bar">
				<div id="left-nav">
					<ul id="primary-nav">
						<li><a href="<?= BASE_URL ?>/Browse/">Browse</a></li>

						<?php if(isset($_SESSION['user'])) { ?>
						<li><a href="<?= BASE_URL ?>/Sell/">Add</a></li>
						<?php } ?>
					</ul>
				</div>
				<div id="right-nav">
					<ul id="right-dec">
						<li><a href="<?=BASE_URL?>/Signup">Register</a></li>
						<li>

							<?php if( !isset($_SESSION['user'])) { ?>
									<a href="<?=BASE_URL?>/login">Login</a>
									<?php } else { ?>
										<div id=logged-box>
											<a href="<?=BASE_URL?>/Profile">
												<?php	echo '<p>Hello &nbsp; <strong>'.$_SESSION['user'].'
												</strong> !</p>'; ?></a>
												<a href="<?=BASE_URL?>/logout"> Logout </a>
											</div>
							<?php } ?>
						</li>
					  <li><a href="<?=BASE_URL?>/cart">Cart</a></li>
					</ul>
							</div>
					</div>
				</div>
