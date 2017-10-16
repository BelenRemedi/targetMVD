$(document).ready(function(){
  $("#recover-password-button").click(function(event) {
    event.preventDefault();
    $( "#login-box" ).hide();
    $( "#recovery-box" ).show();
    $(".link-login-div").hide();
  });
  $("#sign-in-button").click(function(event) {
    event.preventDefault();
    $( "#login-box" ).show();
    $( "#recovery-box" ).hide();
    $(".link-login-div").show();

  });
})
