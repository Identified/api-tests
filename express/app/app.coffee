# Include the cluster module
cluster = require 'cluster'

if cluster.isMaster
  cluster.fork() for [0...require('os').cpus().length]
else
  ## Module dependencies.

  express = require("express")
  routes = require("./routes")
  http = require("http")
  path = require("path")
  app = express()

  # all environments
  app.set "port", process.env.PORT or 3000
  app.use express.logger("dev")
  app.use express.json()
  app.use express.urlencoded()
  app.use express.methodOverride()
  app.use express.bodyParser()
  app.use app.router

  # development only
  if "development" == app.get("env")
    app.use express.errorHandler()
	
  app.get "/hello", routes.hello
  app.post "/:version/json", routes.json

  http.createServer(app).listen app.get("port"), ->
    console.log "Express server listening on port " + app.get("port")
