restify = require 'restify'

server = restify.createServer()

server.get /\/?.*/, restify.serveStatic({directory: './public'})

server.listen 8080, ->
  console.log '%s listening at %s', server.name, server.url