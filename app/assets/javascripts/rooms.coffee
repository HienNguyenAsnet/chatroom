# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'ready turbolinks:load', ->
  roomId = $('.room').data('room-id')

  if roomId && !App.chatChannel
    console.log 'init'
    App.chatChannel = App.cable.subscriptions.create { channel: "ChatChannel", room: roomId },
      received: (data) ->
        $('.chat-histories').append(['<p><span class="author">', data.author, ': </span><span class="message-text">' , data.text, '</span></p>'].join(''))
