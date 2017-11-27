App.room = App.cable.subscriptions.create "RoomChannel", #chat_id: 1,
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    if (data.message && !data.message.blank?)
       $('#messages-table').append '<div class="message">' +
         '<div class="message-user receiver-time">' + data.formattedTime + '</div>' +
         '<div class="message-content receiver">' + data.message.body + '</div>' + '</div>'
       scroll_bottom()
