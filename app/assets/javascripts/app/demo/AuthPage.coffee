module.exports = AuthPage = React.createClass
  render: ->
    <div>
      <a href={@props.dashboard_path}><FaIcon type='angle-right' /> 登录到工作台</a>
    </div>