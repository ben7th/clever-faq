class IndexController < ApplicationController
  def index
    @component_name = 'IndexPage'
    @component_data = {
      landing_path: demo_landing_path
    }
  end
end