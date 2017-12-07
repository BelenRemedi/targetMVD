function scroll_bottom () {
  $('#messages').scrollTop($('#messages')[0].scrollHeight)
}

function open_modal(data) {
  $("p#user-name").text(data.user);
  $('#modal').show();
}
