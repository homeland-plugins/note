window.NoteView = Backbone.View.extend
  el: "body"
  events:
    "click .editor-toolbar a.preview": "togglePreviewView"

  initialize: (opts) ->
    $("<div id='preview' class='markdown form-control' style='display:none;'></div>").insertAfter( $('#note_body') )
    window._editor = new Editor()

  togglePreviewView: (e) ->
    btn = $(e.target)
    preview_box = $('#preview')
    note_body = $('#note_body')
    if btn.hasClass('active')
      preview_box.hide()
      note_body.show()
      btn.removeClass('active')
    else
      btn.addClass('active')
      note_body.hide()
      preview_box.html('Loading...')
      preview_box.css("height", note_body.height())
      preview_box.show()
      $.post '/notes/preview', {body: note_body.val()}, (data)->
        preview_box.html(data)
    false

document.addEventListener 'turbolinks:load',  ->
  if $('body').data('controller-name') in ['notes']
    window._noteView = new NoteView()
