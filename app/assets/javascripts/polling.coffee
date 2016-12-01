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
    first_id = $('.comment').last().data('id')
    # Use this when teams are implemented
    # params={};window.location.search.replace(/[?&]+([^=&]+)=([^&]*)/gi,function(s,k,v){params[k]=v})
    params = /[\?&]team_id=([^&#]*)/.exec(window.location.href);
    if(params == null)
      params = [0, 0]
    # params = $.url(window.location.href).params()
    $.get('/comments', after_id: first_id, team_id: params[1])
    # $.get('/comments', after_id: first_id)
}

jQuery ->
  Poller.poll() if $('#comments').size() > 0
  return