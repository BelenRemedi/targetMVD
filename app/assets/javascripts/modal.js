$(document).ready(function(){
  $(".modal-button").click(function(event) {
    open_home_chat()
  });
  $(".close").click(function(event) {
    $('#modal').hide();
  });
})

function open_home_chat() {
  $('#modal').hide();

  $.getJSON('/welcome/load_chats')
    .done(function( data ) {
      $('.rectangle').html(data.form);
  })
  .fail(function( jqxhr, textStatus, error ) {
    var err = textStatus + ", " + error;
    console.log( "Request Failed: " + err );
  });
}
