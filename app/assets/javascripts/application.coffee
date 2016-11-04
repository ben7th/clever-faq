#= require libs
#= require react-adapter
#= require antd-adapter

# utils
require 'utils/_index'

# layouts
require 'layouts/_index'

# -----------------------------

# app components
window.AppComponents = {}
register = (component, displayName=null)->
  component.displayName = displayName || component.displayName
  window.AppComponents[component.displayName] = component

# auth
register (require 'app/auth/AuthSignInPage'), 'AuthSignInPage'

# app
register (require 'app/IndexPage')

# demo
register (require 'app/demo/DemoVoicePage')
register (require 'app/demo/DemoLinkPage')

register (require 'app/demo/LandingPage')
register (require 'app/demo/AuthPage')