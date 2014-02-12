# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

dispatcher = new WebSocketRails(window.location.host + '/websocket')

channel = dispatcher.subscribe('donation')
channel.bind 'new',(project) ->
  $(".amount_raised[data-id=#{project.id}]").text(project.funds_raised / 100.0)
  $(".recent_donors[data-id=#{project.id}]").html(
      "<ul><li>"
    )

