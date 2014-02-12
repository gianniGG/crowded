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
      console.log projects
      for proj in projects.projects
        console.log('hi')
        $('.proj-container').append("<p>" + proj.name + "</p>")
    )