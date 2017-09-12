<div id="content" >
<h2 style="color: white; font-size: 36px; text-align: center">Sign Up</h2>

<form id="signup" action="<?=BASE_URL?>/Signup/signed" method="POST" onsubmit="return validatePage()">
<p id="checkform"> </p>
  <ul>
  <li><label class="required">Username:
    <input id="username" type="text" placeholder="Enter Username";  name="username"></label></li>
    <p id = "checkuser"> </p>
  <li><label class="required">Password:
    <input id="password" type="password" placeholder="Enter Password"; name="pw"></label></li>
  <li><label class="required">Confirm Password:
    <input id="confirmpw" type="password"placeholder="Confirm Password"; name="confirmpw"></label></li>
    <p id ="checkpw"> </p>
  <li><label class="required">Email address:
    <input id = "email" type="text" placeholder="Enter Email"; name="email"></label></li>
  <p id = "checkemail"> </p>
  <li><label>First name: <input id = "firstname" type="text" placeholder="Enter First Name"; name="first_name"></label></li>
  <li><label>Last name: <input id = "lastname" type="text"placeholder="Enter Last Name"; name="last_name"></label></li>

  <li><input id="submit" type="submit" name="submit" value="Create Account"></li>
</ul>

</form>

</div>
