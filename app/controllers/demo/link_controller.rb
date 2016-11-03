class Demo::LinkController < ApplicationController
  def show
    @component_name = 'DemoLinkPage'
    @component_data = {}
  end
end