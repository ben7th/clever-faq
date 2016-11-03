App.link_demo = App.cable.subscriptions.create "LinkDemoChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (message)->
    switch message.action
      when 'toggle_text'
        jQuery(document).trigger 'link-demo:toggle-text'
      when 'show_modal'
        jQuery(document).trigger 'link-demo:show-modal', message

  toggle_text: ->
    @perform 'toggle_text'

  show_modal: (oper)->
    @perform 'show_modal', oper: oper