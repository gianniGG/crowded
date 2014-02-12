# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

dispatcher = new WebSocketRails(window.location.host + '/websocket')
channel = dispatcher.subscribe('user_donation')
channel.bind 'new', (user) ->
  $(".user_points[data-id=#{user.id}]").text(user.points)
