  var clicked = false;

$(document).ready(function(){

  $('.st0').click( function() {
      clicked = true;
      check();
    });

  // event handler for checkboxes with name "checkbox"
  $('input[name="checkbox"]').click(function(){
    // by default, hide everything
    $('.gallery-item').hide();

    // iterate through only the checked checkboxes
    $('input[name="checkbox"]:checked').each(function(){
      var checkedVal = $(this).val(); // value of checked box


      // show products matching that value
      switch(checkedVal) {
        case 'new':
          $('.new-img').show(); // show the Small items
          break;
        case 'hot':
          $('.hot-img').show();
          break;
        case 'recommended':
          $('.rec-img').show();
          break;
        case 'featured':
          $('.fea-img').show();
          break;
      }
    });
  });

  // $('#enterTitle').submit(function(e){
  //   var title = $('#editTitleID').val();
  //   var id = $('')
  //
  // }
  // by default, check all the boxes
  $('input[name="checkbox"]').each(function(){
    $(this).prop("checked", true); // check the box
  })

  // event handler for Follow buttons
  $('button.follow').click(function(){
    var button = $(this);
    var username = $(this).val();
    $.post(
      baseURL+'/user/follow/',
      { 'username': username },
      function(data) {
        if(data.success == 'success') {
          // Follow successful
          // Already followed, so remove the button
          $(button).remove();
        } else if (data.error != '') {
          alert(data.error); // show error as popup
        }
      },
      'json'
    );
  });

});


function check() {
 if(clicked) {
 document.getElementById("outer-modal").style.visibility = "visible";
 }
 else {
 document.getElementById("outer-modal").style.visibility = "hidden";
 }
}

document.addEventListener("DOMContentLoaded", function() {
  check();
  loadInfo('XMLID_1_');
  loadInfo('XMLID_2_');
  loadInfo('XMLID_3_');
  loadInfo('XMLID_4_');
  loadInfo('XMLID_5_');
  loadInfo('XMLID_6_')
});
function loadInfo(imgname) {
  var modal = document.getElementById('outer-modal');
  var image = document.getElementById(imgname);
  var span = document.getElementsByClassName("close")[0];
  var submit = document.getElementById('submit');
  image.onclick = function() {
    modal.style.display = "block";
  }
  span.onclick = function() {
    modal.style.display = "none";
  }
  sub.onclick = function() {
	  modal.style.display = "none";
   }
   window.onclick = function(event) {
     if (event.target == modal) {
        modal.style.display = "none";
    }
   }
}
