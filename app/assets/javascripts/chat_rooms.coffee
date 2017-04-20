# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

# Delivers chat_room.id if #messages exists
jQuery(document).on 'turbolinks:load', ->
  messages = $('#messages')
  if $('#messages').length > 0

    App.global_chat = App.cable.subscriptions.create {
      channel: "ChatRoomsChannel"
      chat_room_id: ''
      },

      connected: ->
        # Called when subscription ready on server

      disconnected: ->
        # Called when subscription terminated on server

      received: (data) ->
        # Data received

      send_message: (message, chat_room_id) ->
        @perform 'send_message', message: message, chat_room_id: chat_room_id

# Send message to all chat room visitors if msg body length >= 2
    $('#new_message').submit (e) ->
      $this = $(this)
      textarea = $this.find('#message_body')
      if $.trim(textarea.val()).length > 1
        App.global_chat.send_message textarea.val(), messages.data('chat-room-id')
        textarea.val('')
