module.exports = LandingPage = React.createClass
  render: ->
    <div>
      <a href={@props.auth_path}><FaIcon type='angle-right' /> 登录</a>
    </div>