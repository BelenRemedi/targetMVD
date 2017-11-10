# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
submit_message = () ->
  $('#message_body').on 'keydown', (event) ->
    if event.keyCode is 13
      $('input').click()
      event.target.value = ""
      event.preventDefault()

scroll_bottom = () ->
  $('#messages').scrollTop($('#messages')[0].scrollHeight)
