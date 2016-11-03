class Demo::VoiceController < ApplicationController
  def show
    @component_name = 'DemoVoicePage'
    @component_data = {}
  end
end