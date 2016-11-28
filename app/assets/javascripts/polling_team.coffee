ready = ->

window.TeamPoller = {
  poll: (timeout) ->
    if timeout is 0
      TeamPoller.request()
    else
      this.pollTimeout = setTimeout ->
        TeamPoller.request()
      , timeout || 500
       
  clear: -> clearTimeout(this.pollTimeout)
  request: ->
    $.ajax 'teams/checkTeam',
        type: 'GET'
        dataType: 'json'
        error: (jqXHR, textStatus, errorThrown) ->
            $('body').append ""
        success: (data, textStatus, jqXHR) ->
            $('body').append window.location.pathname
            if data != -1
                window.location = "/comments/new?team=" + data
            else
                TeamPoller.poll()
}

jQuery ->
  TeamPoller.poll() if true
  return

