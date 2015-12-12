$(function() {
  window.realtime = {
    connect : function(){
      window.socket = io.connect("http://localhost:5001");

      window.socket.on("new-buzz-session", function(message){
        console.log(message);
      });
      window.socket.on("buzz", function(message){
        console.log(message);
      });
    }
  }
  window.realtime.connect();
});

