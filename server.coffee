serv = require "node-static"
http = require "http"
util = require "util"

webroot = '.'
port = 5000

file = new(serv.Server)(webroot,
  cache: 600,
  headers: { 'X-Powered-By': 'node-static' })

http.createServer((req, res) ->
  req.addListener 'end', ->
    req.url = "main.html" if req.url == "/"
    file.serve req, res, (err, result) ->
      if err
        console.error 'Error serving %s - %s', req.url, err.message
        res.writeHead err.status, err.headers
        res.end()
        ###
        if err.status == 404 or err.status == 500
          file.serveFile util.format('/%d.html', err.status), err.status, {}, req, res
        else
          res.writeHead err.status, err.headers
          res.end()
        ###
      else
        console.log '%s - %s', req.url, res.message
).listen(port)

console.log 'node-static running at http://localhost:%d', port