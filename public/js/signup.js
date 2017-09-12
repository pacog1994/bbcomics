$(document).ready(function(){
  $('#username').blur(function(){
    // console.log('blurred');

      $('#username').addClass('available');
    var username = $(this).val();
    $.get(
      baseURL+'/Signup/check',
      { 'username': username  },
      function(data){
        if(data.status == 'available') {
          $('#username').addClass('available').removeClass('unavailable');
          document.getElementById("submit").disabled = false;
        } else if(data.status == 'unavailable') {
          $('#username').addClass('unavailable').removeClass('available');
            document.getElementById("checkuser").innerHTML =
            "This username is unavailable, please try again.";
            document.getElementById("submit").disabled = true;
        }
      },
      "json"
    );
  });
  var password;
  $('#password').blur(function() {
    password = $(this).val();
  });
    $('#confirmpw').blur(function() {
      var confirm = $(this).val();
      if(password.localeCompare(confirm) == 0) {

         document.getElementById("checkpw").innerHTML = "";
         document.getElementById("submit").disabled = false;

      }
      else {
         document.getElementById("checkpw").innerHTML = "This passwords do not match, please try again.";
         document.getElementById("submit").disabled = true;
      }

    });
    $('#email').blur(function() {
      console.log("hello");
      var email = $(this).val();
      if(email.indexOf("@")>=1 && email.indexOf(".")>=1) {
        document.getElementById("checkemail").innerHTML = "";
        document.getElementById("submit").disabled = false;
      }
      else {
            document.getElementById("checkemail").innerHTML = "Please enter a valid email";
            document.getElementById("submit").disabled = true;
      }
    });
    $('#pw').blur(function() {
      var pw = $(this).val();
      if(pw.localeCompare("") != 0) {
         document.getElementById("submitpw").disabled = false;
      }
      else {
        document.getElementById("checkpw").innerHTML = "Password cannot be empty";
         document.getElementById("submitpw").disabled = true;
      }
      });
  });
function validatePage() {
  var isValid = true;
  $('#username').each(function() {
     var element = $(this);
     if (element.val() == "") {
         isValid = false;
     }
  });
  $('#password').each(function() {
     var element = $(this);
     if (element.val() == "") {
         isValid = false;
     }
  });
  $('#confrimpw').each(function() {
     var element = $(this);
     if (element.val() == "") {
         isValid = false;
     }
  });
  $('#email').each(function() {
     var element = $(this);
     if (element.val() == "") {
         isValid = false;
     }
  });
  $('#firstname').each(function() {
     var element = $(this);
     if (element.val() == "") {
         isValid = false;
     }
  });
  $('#lastname').each(function() {
     var element = $(this);
     if (element.val() == "") {
         isValid = false;
     }
  });
  if(!isValid) {
     document.getElementById("checkform").innerHTML = "Please fill out all fields";
  }
  return isValid
}
