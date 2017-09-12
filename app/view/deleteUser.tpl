<div id="content" style="height: 500px"> <!-- content containter -->
  <?php if(isset($_SESSION['user'])) {
    $userSession = $_SESSION['user'];
    $user = User::loadByUsername($userSession);
    echo '<br><br><br><form name="delete" id="delete" method="POST" accep-charset="utf-8"> <!-- Credit to Hongkiat.com for teaching me how to make a login form-->
    <label style="font-size: 64px; color: white; text-align: center;">DELETE '.$_SESSION['user'].'?</label>
    <ul id="editable" style="list-style-type: none;">
      <li style="margin-bottom: 20px"><input style="width: 150px; height: 50px;
        font-size: 16px" formaction="'.BASE_URL.'/deleteUserProcess/profile/'.$user->get('id').'/process"
      type="submit" name="submit" value="YES"></li>
      <li style="margin: 0;"><input style="width: 150px; height: 50px; font-size: 16px"
        formaction="'.BASE_URL.'/Profile" type="submit" name="submit" value="NO, bring me back!"></li>
    </ul>
  </form>';
  }
    ?>
</div>
