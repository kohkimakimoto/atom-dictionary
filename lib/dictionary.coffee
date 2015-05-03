spawn = require('child_process').spawn

module.exports = Dictionary =
  activate: (state) ->
    atom.commands.add('.platform-darwin atom-workspace', {
      'dictionary:look-up': @lookUp,
    })

  lookUp: () ->
    editor = atom.workspace.getActiveTextEditor()
    return if !editor

    selection = editor.getLastSelection().getText()
    spawn('open', ['dict://' + selection])
