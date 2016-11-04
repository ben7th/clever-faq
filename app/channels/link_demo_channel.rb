# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
class LinkDemoChannel < ApplicationCable::Channel
  def subscribed
    stream_from "link_demo_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def toggle_text(message)
    ActionCable.server.broadcast "link_demo_channel", message
  end

  def show_modal(message)
    ActionCable.server.broadcast "link_demo_channel", message
  end

  def visit_site(message)
    ActionCable.server.broadcast "link_demo_channel", message
  end
end
