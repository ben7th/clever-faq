class IndexController < ApplicationController
  def index
    if not user_signed_in?
      redirect_to '/users/sign_in'
      return
    end

    @component_name = 'IndexPage'
    @component_data = {}
  end
end