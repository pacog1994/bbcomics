<div id="content" style="height: 500px"> <!-- content containter -->
<br><br><br><form name="login" id="login-box" action="<?=BASE_URL?>/login/process" method="POST" accep-charset="utf-8"> <!-- Credit to Hongkiat.com for teaching me how to make a login form-->
  <ul>
    <li><label for="user">User</label>
      <input style="width: 120px" type="text" name="un" placeholder="enter your username..." required></li>
      <li><label for="password">Password</label>
      <input style="width: 120px" type="password" name="pw" placeholder="enter your password..." required></li>
      <li><input type="submit" value="Login"></li>
  </ul>
</form>
</div>
