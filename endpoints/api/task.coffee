"use strict"
Yoi     = require "yoi"
# Models
Tasks   = require "../../commons/models/task"

module.exports = (server) ->

  server.post "/api/task", (request, response, next) ->
    rest = new Yoi.Rest request, response
    rest.required ["name"]
    Tasks.create(_parameters(rest)).then (error, tasks) ->
      if error then rest.badRequest() else rest.run tasks.parse()

_parameters = (rest) ->
  name        : rest.parameter("name").trim()
  description : rest.parameter "description"