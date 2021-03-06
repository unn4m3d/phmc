# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ = require("jquery")

api_badge_class = (players, max) ->
  if players == 0
    "badge-primary"
  else if players < max * 3 / 4
    "badge-success"
  else if players < max - 1
    "badge-warning"
  else
    "badge-danger"

api_badge = (sdata) ->
  if sdata.online
    "<span class='badge #{api_badge_class(sdata.players, sdata.max)}'>#{sdata.players}/#{sdata.max}</span>"
  else
    "<span class='badge badge-secondary'>offline</span>"

api_ver_badge = (version) ->
  "<span class='badge badge-primary'>#{version}</span>"

api_create_progress = (elem,sdata) ->
  console.log("Writing info")
  id = "server-#{sdata.name}"
  elem.append $("<div class='text-xs-center' id='#{id}'></div>").html("<a href=\"#{sdata.link}\">#{sdata.name}</a> #{api_ver_badge(sdata.version)} #{api_badge(sdata)}")
  if sdata.online
    elem.append $("<progress class='progress' value='#{sdata.players.toString().replace(/[^0-9]/g,'')}' max='#{sdata.max.toString().replace(/[^0-9]/g,'')}' aria-describedby='#{id}' />")
  else
    elem.append $("<progress class='progress server-full' value='1' max='1' aria-describedby='#{id}' />")

api_write_error = (elem,json) ->
  console.log "Writing error"
  elem.append($("<div class='alert'>#{json.error}</div>"))

api_write_info = (elem,short_name) ->
  $.ajax
    dataType: "json"
    url: "/api/server?short_name=#{short_name}"
    success: (json) ->
      console.log json
      if json.error?
        api_write_error elem,json
      else
        api_create_progress elem,json
    error: (j)->
      console.log j
      api_write_error elem,
        error: "Cannot retrieve data"

api_draw = (json) ->
  console.log "Loading"
  mondiv = $("#tsmon")
  if mondiv.length
    console.log("Monitoring enabled")
    console.log json
    mondiv.empty()
    #mondiv.append($("<h3>Мониторинг</h3>"))
    mondiv.append("<!-- Generated in app/assets/javascripts/home.coffee -->")
    if json.servers? && json.servers.length > 0
      for serv in json.servers
        console.log serv
        api_write_info mondiv, serv.short_name
    else
      mondiv.append($("<div class='text-muted'></div>").text("Не найдены сервера"))

  else
    console.log("Monitoring disabled")

  graph = $("#tsgraph")
  if graph.length
    console.log("Graph enabled")
    $.ajax
      url: "/api/graph"
      dataType: "json"
      success: (json) ->
        console.log json
        new Chart graph,
          type: 'line'
          data: json
          options:
            scales:
              xAxes : [
                type: 'time'
                time:
                  unit: 'minute'
                  distribution: 'linear'
                  parser: moment
              ]
              yAxes : [
                type: 'linear'
                ticks:
                  suggestedMin: 0
              ]
      error: (json) ->
        console.error json
  else
    console.log("Graph disabled")

window.onload = () ->
  console.log("home.coffee loaded")
  $.ajax
    url: "/api/servers"
    dataType: "json"
    success: (json) ->
      console.log(json)
      api_draw json
    error: (json) ->
      console.log json