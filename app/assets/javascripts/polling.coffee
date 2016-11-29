
window.Poller = {
  poll: (timeout) ->
    if timeout is 0
      Poller.request()
    else
      this.pollTimeout = setTimeout ->
        Poller.request()
      , timeout || 3000
  clear: -> clearTimeout(this.pollTimeout)
  request: ->
    first_id = $('.comment').first().data('id')
    # team_id = 1
    $.get('/comments', {after_id: first_id, team_id: 1})
}

jQuery ->
  Poller.poll() if $('#comments').size() > 0
  return
