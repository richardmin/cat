window.TeamPoller = {
  poll: (timeout) ->
    if timeout is 0
      TeamPoller.request()
    else
      this.pollTimeout = setTimeout ->
        TeamPoller.request()
<<<<<<< HEAD
      , timeout || 1000
=======
      , timeout || 500
>>>>>>> origin/modeling-teams
       
  clear: -> clearTimeout(this.pollTimeout)
  request: ->
    $.ajax '/teams/checkTeam',
        type: 'GET'
        dataType: 'json'
        error: (jqXHR, textStatus, errorThrown) ->
            $('body').append jqXHR.responseText
        success: (data, textStatus, jqXHR) ->
<<<<<<< HEAD
            #$('body').append data
            if data != -1 
                if window.location.pathname == "/teams/new"
                    window.location = "/comments/new?team=" + data
                else
                    TeamPoller.poll()
=======
            $('body').append window.location.pathname
            if data != -1
                window.location = "/comments/new?team=" + data
>>>>>>> origin/modeling-teams
            else
                TeamPoller.poll()
}

jQuery ->
  TeamPoller.poll() if true
  #TeamPoller.poll() if $('#comments').size() > 0
  return

