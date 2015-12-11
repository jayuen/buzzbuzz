$(function() {
  // Here we instantiate a new WebSocketRails instance
  dispatcher = new WebSocketRails("localhost:3000/websocket");

  dispatcher.subscribe('winning_buzzes').bind('winner',
    function(message) {
      document.querySelector('#winner-result').innerHTML = message.name;
    }
  )

  dispatcher.subscribe('buzz_sessions').bind('new',
    function(message) {
      document.querySelector('#buzz-session .time').innerHTML = message.timestamp;
    }
  )
});
