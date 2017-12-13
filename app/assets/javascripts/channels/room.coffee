App.room = App.cable.subscriptions.create "RoomChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    if (data.message && !data.message.blank?)
       chatId = $('#chat-rectangle').data('chatId')
       if (data.message.chat_id == chatId)
         $('#messages-table').append '<div class="message">' +
           '<div class="message-user receiver-time">' + data.formattedTime + '</div>' +
           '<div class="message-content receiver">' + data.message.body + '</div>' + '</div>'
       if $('#messages').length
         scroll_bottom()
       else
         update_unread_messages_count(data)
