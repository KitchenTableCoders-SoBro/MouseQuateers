restify = require 'restify'
server = restify.createServer()
uuid = require 'node-uuid'

server.get /\/?.*/, restify.serveStatic directory: './public', default: 'index.html', charSet: 'UTF-8'

io = require('socket.io').listen(server)
io.sockets.on 'connection', (socket) ->
    socket.emit 'id', uuid.v1()

    socket.on 'mousemove', (data) ->
        io.sockets.emit 'mousemove', data

server.listen 8080, ->
  console.log '%s listening at %s', server.name, server.url