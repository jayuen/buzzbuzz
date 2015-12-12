var io = require('socket.io').listen(5001),
    redis = require('redis').createClient();

io.set('origins', 'http://localhost:3000');

redis.subscribe('buzz');
redis.subscribe('new-buzz-session');

io.on('connection', function(socket){
  redis.on('message', function(channel, message){
    socket.emit(channel, JSON.parse(message));
  });
});
