spawn = require('child_process').spawn

module.exports = Dictionary =
  activate: (state) ->
    atom.commands.add('atom-text-editor', {
      'dictionary:lookup': @lookup,
    })

  lookup: () ->
    editor = atom.workspace.getActiveTextEditor()
    return if !editor

    selection = editor.getLastSelection().getText()
    spawn('open', ['dict://' + selection])
