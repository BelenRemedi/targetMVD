function scroll_bottom () {
  $('#messages').scrollTop($('#messages')[0].scrollHeight)
}

function open_modal(data) {
  $('#user-name').text(data.user);
  $('#modal').show();
}

function update_unread_msg_count(data) {
  var count = parseInt($('#'+'chat-'+data.message.chat_id).data('unreadCount'));
  $('#'+'chat-'+data.message.chat_id).find('p').text(count+1);
  $('#'+'chat-'+data.message.chat_id).data('unreadCount',count+1)
  $('#'+'chat-'+data.message.chat_id).show();
}

function update_global_unread_msg_count(data) {
  var count = parseInt($('.unread-msg-div-chat').data('unreadCount'));
  $('.unread-msg-div-chat').find('p').text(count+1);
  $('.unread-msg-div-chat').data('unreadCount',count+1)
  $('.unread-msg-div-chat').show();
}

function errorHandling ( jqxhr, textStatus, error ) {
  var err = textStatus + ', ' + error;
  console.log( 'Request Failed: ' + err );
}
