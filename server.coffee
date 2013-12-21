restify = require 'restify'

server = restify.createServer()

options =
    directory: './public'
    default: 'index.html'

server.get /\/?.*/, restify.serveStatic(options)

server.listen 8080, ->
  console.log '%s listening at %s', server.name, server.url