"use strict"

Yoi       = require "yoi"

module.exports = ->
  tasks = []

  tasks.push _new(item) for item in test.tasks

  tasks


# Promises
# ==============================================================================
_new = (item) -> ->
  promise = new Yoi.Hope.Promise()
  Yoi.Test "POST", "api/task", item, null, "Se crea la tarea #{item.name}.", 200, (response) ->
    item.id = response.id
    promise.done null, response
  promise