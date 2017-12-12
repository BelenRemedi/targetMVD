$(document).ready(function(){
  $( '.rectangle' ).on( 'click', '#back-button-chat', function() {
    var chatId = $('#chat-rectangle').data('chatId');
    $.getJSON('/welcome/update_chats', { chat_id: chatId })
      .done(function( data ) {
        $('.rectangle').html(data.form);
    })
    .fail(errorHandling);
  });

  $( '.rectangle' ).on( 'click', '.back-button', function() {
    $.getJSON('/welcome/load_chats')
      .done(function( data ) {
        $('.rectangle').html(data.form);
    })
    .fail(errorHandling);
  });
})
