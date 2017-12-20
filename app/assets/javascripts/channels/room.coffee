App.room = App.cable.subscriptions.create "RoomChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    if (data.message && !data.message.blank?)
       chatId = $('#chat-rectangle').data('chatId')
       if ((data.message.chat_id == chatId) && ($('#messages').length))
         $('#messages-table').append '<div class="message">' +
           '<div class="message-user receiver-time">' + data.formattedTime + '</div>' +
           '<div class="message-content receiver">' + data.message.body + '</div>' + '</div>'
         scroll_bottom()
       else if $('#messages').length
         update_global_unread_msg_count(data)
       else
         update_unread_msg_count(data)
         update_global_unread_msg_count(data)
