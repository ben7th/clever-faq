module.exports = DemoLinkPage = React.createClass
  render: ->
    if device.mobile()
      <Mobile />
    else
      <PC />

{ Alert, Row, Col, Button } = antd

Mobile = React.createClass
  render: ->
    <div>
      <Alert message='手机 PC 联动测试' description='这是手机页面' />
      <div style={marginTop: '1rem', marginBottom: '1rem'}>
        <Button style={marginRight: '1rem'} type='primary' 
          onClick={-> App.link_demo.toggle_text('down')}>向下切换</Button>
        <Button style={marginRight: '1rem'} type='primary' 
          onClick={-> App.link_demo.toggle_text('up')}>向上切换</Button>
      </div>
      <div style={marginTop: '1rem', marginBottom: '1rem'}>
        <Button style={marginRight: '1rem'} type='primary' 
          onClick={-> App.link_demo.show_modal('open')}>弹出提示框</Button>
        <Button style={marginRight: '1rem'} type='primary' 
          onClick={-> App.link_demo.show_modal('close')}>关闭提示框</Button>
      </div>
      <div>
        <Button style={marginRight: '1rem'} type='primary' 
          onClick={-> App.link_demo.visit_site()}>打开必应</Button>
      </div>
    </div>


PC = React.createClass
  render: ->
    <div>
      <Alert 
        message='手机 PC 联动测试' 
        description={
          <div>
            <p>这是 PC 测试页面</p>
            <p>你可以通过手机打开这个页面，然后通过手机操作 DEMO</p>
          </div>
        } 
      />
      
      <div style={marginBottom: '1rem'}>
        <p style={marginBottom: '1rem'}>扫描二维码打开这个页面</p>
        <div style={padding: '0.5rem', border: 'solid 1px #ddd', display: 'inline-block', fontSize: 0}>
          <QRCode value={location.href} />
        </div>
      </div>

      <QiangJinJiu />
      <ShowModal />
    </div>

QiangJinJiu = React.createClass
  getInitialState: ->
    texts: [
      '白日依山尽'
      '黄河入海流'
      '欲穷千里目'
      '更上一层楼'
    ]
    idx: 0

  render: ->
    text = @state.texts[@state.idx]
    <div>
    <div style={display: 'inline-block'}>
    {
      @state.texts.map (t, idx)=>
        style = if @state.idx == idx then {color: 'white', backgroundColor: '#4C8BF5'} else {}
        <h2 style={style} key={idx}>{t}</h2>
    }
    </div>
    </div>

  toggle_down: ->
    idx = @state.idx
    idx = (idx + 1) % @state.texts.length
    @setState idx: idx

  toggle_up: ->
    idx = @state.idx
    idx = (idx + @state.texts.length - 1) % @state.texts.length
    @setState idx: idx

  componentDidMount: ->
    jQuery(document).on 'link-demo:toggle_text', (evt, message)=>
      switch message.direction
        when 'down' then @toggle_down()
        when 'up' then @toggle_up()

    jQuery(document).on 'link-demo:visit_site', (evt, message)=>
      Turbolinks.visit 'http://cn.bing.com/'

  componentWillUnmount: ->
    jQuery(document).off 'link-demo:toggle_text'
    jQuery(document).off 'link-demo:visit_site'

ShowModal = React.createClass
  getInitialState: ->
    modal: null

  render: ->
    <div />

  open: ->
    { Modal } = antd
    return if @state.modal?
    @setState modal: Modal.confirm {
      title: 'DEMO'
      content: 
        <div>
          <p style={marginBottom: '1rem'}>你用手机打开了一个对话框</p>
          <img src='http://i.teamkn.com/i/Q7DXOTFS.png' />
        </div>
    }

  close: ->
    return if not @state.modal?
    @state.modal.destroy()
    @setState modal: null

  componentDidMount: ->
    jQuery(document).on 'link-demo:show_modal', (evt, message)=>
      switch message.oper
        when 'open' then @open()
        when 'close' then @close()

  componentWillUnmount: ->
    jQuery(document).off 'link-demo:show_modal'