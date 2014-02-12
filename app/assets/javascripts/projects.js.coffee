# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

#websocket donations
dispatcher = new WebSocketRails(window.location.host + '/websocket')
channel = dispatcher.subscribe('project_donation')
channel.bind 'new',(project) ->
  $(".amount_raised[data-id=#{project.id}]").text(project.funds_raised / 100.0)
  recent_five = $(".recent_donors[data-id=#{project.id}]").html("<ul></ul>")
  for donor in project.recent_donors
    recent_five.prepend("<li>" + donor + "</li>")

#search projects
$ ->
  $('#project_search').on 'keyup', ->
    $('.proj-container').html('<div></div>')
    $.post('/projects/search', {search: $(this).val() }, (projects) ->
      for proj in projects.projects
        $('.proj-container').append("<h3>" + proj.name +
        "<h4> Headline: " + proj.headline + "</h4>" +
        "<h4> Raised: £" + proj.funds_raised/100 + "</h4>"
        "</h3>")
    )