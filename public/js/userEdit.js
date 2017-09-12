$(document).ready(function(){

  var check = true;
  // event handler for buttons with type "text, submit"
  $('input[name="edit"]').click(function(){
    // by default, hide everything
    if (check) {
      $('input[type="text"]').hide();
      $('input[type="submit"]').hide();
    }
    else {
      $('input[type="text"]').show();
      $('input[type="submit"]').show();
      }
      check = !check;
})});
