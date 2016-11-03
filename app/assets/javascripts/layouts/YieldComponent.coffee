{ Alert, Icon } = antd

module.exports = YieldComponent = React.createClass
  render: ->
    { name, data } = @props.component

    try
      console.debug "render content component: ", name
      component = window.AppComponents[name]
      throw "组件 #{name} 没有注册" unless component?
      React.createElement component, data
    catch e
      <Alert
        message='页面组件渲染错误'
        description={@description(e)}
        type='error'
        showIcon
      />

  description: (e)->
    <div>
      <span>{e} </span>
      {
        if not jQuery.isEmptyObject window.current_user
          <a onClick={@sign_out}><Icon type='logout' /> 登出</a>
      } 
    </div>

  sign_out: (e)->
    jQuery.ajax
      url: window.current_user.sign_out_url
      type: 'DELETE'
    .done ->
      location.href = '/'