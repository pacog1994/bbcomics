<div id="content"> <!-- content containter -->
  <?php if(isset($_SESSION['user'])) {
      $userSession = $_SESSION['user'];
      $user = User::loadByUsername($userSession);

	     echo '
       <div id="profileSection1">
       <!-- <img src="http://www.mukeshambani.com/photo/default.jpg" id="profilePic">
       </img> -->

       <p id="profile_user"><strong>'.$_SESSION['user'].'</strong>
                <input type="button" name="edit" value="edit"></input>
      </p>

       <!-- <div id="user-control">

         <a href="'.BASE_URL.'/deleteUser/profile/'. $user->get('id').'"><input type="button" name="delete" value="delete"></input></a>
      </div> -->

      <form id ="user_setting_changes" action="'.BASE_URL.'/settingChanges/profile/'.$user->get('id').'" method="POST">

            <p id = "password_user"> '. $user->get('pw').'
              <input id="pw" type="text" name="password" value="" placeholder="enter password: "></input>
              <input id="submitpw" type="submit" name="submit" value="Save"></input>
              <p id="checkpw"></p>
            </p>
            <p id = "Name_user"> '.$user->get('first_name') .'&nbsp;'. $user->get('last_name') .'
              <input type="text" name="firstName" value="" placeholder="enter first name: "></input>
              <input type="text" name="lastName" value="" placeholder="enter last name: "></input>
              <input type="submit" name="submit" value="Save"></input>
            </p>
              <p id = "email_user"> '. $user->get('email').'
                <input id="email" type="text" name="email" value="" placeholder="enter email: "></input>
                <input id="submit" type="submit" name="submit" value="Save"></input>
                <p id="checkemail"></p>
              </p>
      </form>

      <form id = "gendergroup" action="'.BASE_URL.'/genderSelect/profile/'.$user->get('id').'" method="POST">
            <p id ="gender">  '. $user->get('gender').'
            <input type="radio" name="gender" value="male"> Male
            <input type="radio" name="gender" value="female"> Female
            <input type="radio" name="gender" value="other"> Other
            <input type="submit" name="submit" value="Save"></input></p>
        </form>';
      } ?>

    </div>
    <!-- This contains the Description of the user -->
    <div id ="profileSection2">
      About Me:
        <?php if(isset($_SESSION['user'])) {
          $userSession = $_SESSION['user'];
          $user = User::loadByUsername($userSession);
          echo '
          <form id ="description_changes" action="'.BASE_URL.'/descriptionSelect/profile/'.$user->get('id').'"
            method="POST" style="	height: 80%; width: 80%;">
          <textarea id="description_box" name="description" placeholder="Write description here... ">'.$user->get('description').'</textarea></br>
          <input type="submit" name="submit" value="Save"></input></form>';
        } ?>
      </div>
      <!-- This contains the related uploadedImages of the user -->
</div>

	<script type="text/javascript" src="<?= BASE_URL ?>/public/js/userEdit.js"></script>
	<script type="text/javascript" src="<?= BASE_URL ?>/public/js/signup.js"></script>
