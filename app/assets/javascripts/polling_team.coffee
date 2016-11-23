ready = ->

window.TeamPoller = {
  poll: (timeout) ->
    if timeout is 0
      TeamPoller.request()
    else
      this.pollTimeout = setTimeout ->
        TeamPoller.request()
      , timeout || 3000
       
  clear: -> clearTimeout(this.pollTimeout)
  request: ->
    $.ajax 'teams/checkTeam',
        type: 'GET'
        dataType: 'json'
        error: (jqXHR, textStatus, errorThrown) ->
            $('body').append ""
        success: (data, textStatus, jqXHR) ->
            $('body').append "looking for team"
            if data != -1
                window.location = "/comments/new?team=" + data
}

jQuery ->
  TeamPoller.poll() if true
  return

$(document).ready(ready)
$(document).on('page:load', ready)
