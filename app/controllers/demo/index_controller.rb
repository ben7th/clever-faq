class Demo::IndexController < ApplicationController
  def index
    @component_name = 'LandingPage'
    @component_data = {
      auth_path: demo_auth_path
    }
  end

  def auth
    @component_name = 'AuthPage'
    @component_data = {
      
    }
  end
end