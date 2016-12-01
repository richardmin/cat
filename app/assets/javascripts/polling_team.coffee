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
    $.ajax '/teams/checkTeam',
        type: 'GET'
        dataType: 'json'
        error: (jqXHR, textStatus, errorThrown) ->
        success: (data, textStatus, jqXHR) ->
            if data != -1
                window.location = "/comments/new?team_id=" + data
            else 
              # if window.location.pathname == "/teams/new" #this makes it so that you only poll in teams/new
                TeamPoller.poll()
}

