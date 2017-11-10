$(document).ready(function(){
  $(".chat-receiver").click(function(event) {
    console.log('chatssss')
    event.preventDefault();
    $.getJSON('/chats/load_chat', function(data) {
      console.log(data)
      $('.rectangle').html(data.form);

      $('#message_body').keydown(function(event) {
        if ( event.which == 13 ) {
            $('.chat-submit').click()
            event.target.value = ""
            event.preventDefault()
        }
      });

      $('#messages').scrollTop($('#messages')[0].scrollHeight)


    });

  });
})
