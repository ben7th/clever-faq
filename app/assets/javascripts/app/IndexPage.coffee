module.exports = IndexPage = React.createClass
  render: ->
    { Button } = antd

    <div>
      <div style={marginBottom: '1rem'}>
        <Button><a>演示首页</a></Button>
      </div>
      <div style={marginBottom: '1rem'}>
        <Button><a href='/demo/voice'>语音输入测试</a></Button>
      </div>
      <div>
        <Button><a href='/demo/link'>联动操作测试</a></Button>
      </div>
    </div>