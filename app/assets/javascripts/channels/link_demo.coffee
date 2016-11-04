App.link_demo = App.cable.subscriptions.create "LinkDemoChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (message)->
    jQuery(document).trigger "link-demo:#{message.action}", message

  toggle_text: (direction)->
    @perform 'toggle_text', direction: direction

  show_modal: (oper)->
    @perform 'show_modal', oper: oper

  visit_site: ->
    @perform 'visit_site'