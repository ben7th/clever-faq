#= require react_ujs

window.React = require 'react'
window.ReactDOM = require 'react-dom'

window.ReactRailsUJS.unmountComponents = (searchSelector)->
  nodes = window.ReactRailsUJS.findDOMNodes(searchSelector)
  for node in nodes
    key = Object.keys(node.firstChild)[0]
    ReactDOM.unmountComponentAtNode(node) if key

window.MediaQuery = require 'react-responsive'

# https://npm.taobao.org/package/qrcode.react
window.QRCode = require('qrcode.react')