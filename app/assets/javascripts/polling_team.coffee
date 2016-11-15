window.TeamPoller = {
  poll: (timeout, id) ->
    found = false
    if timeout is 0
      found = TeamPoller.request()
    else
      this.pollTimeout = setTimeout ->
        found = TeamPoller.request()
      , timeout || 5000
    if found == true
        alert("hello");
  clear: -> clearTimeout(this.pollTimeout)
  request: ->
    $.get('/teams/checkTeam')
}

jQuery ->
  TeamPoller.poll() if true
  return