$(function() {
  // Here we instantiate a new WebSocketRails instance
  dispatcher = new WebSocketRails("localhost:3000/websocket");
  var channel = dispatcher.subscribe('default');

  // We bind the incoming message event
  channel.bind('winner',
    function(message) {
      document.querySelector('#winner-result').innerHTML = message;
    })
});
