const express = require('express')
const app = express()
const http = require('http').Server(app)
const io = require('socket.io')(http)

var keypress = require('keypress');

// make `process.stdin` begin emitting "keypress" events
keypress(process.stdin);

// listen for the "keypress" event
process.stdin.on('keypress', function (ch, key) {
  console.log('got "keypress"', key);
  sockets.forEach(socket => {
    socket.emit('text', key.name)
  })
  if (key && key.ctrl && key.name == 'c') {
    process.stdin.pause();
  }
});

process.stdin.setRawMode(true);
process.stdin.resume();

http.listen(1339, () => {
  console.log(`Listening on port 1339`)
})

let sockets = []
io.on('connection', socket => {
  sockets.push(socket)
  console.log('socket connected', sockets.length)

  socket.on('disconnect', () => {
    sockets = sockets.filter(s => {
      return s !== socket
    })
    console.log('socket disconnected', sockets.length)
  })
})
