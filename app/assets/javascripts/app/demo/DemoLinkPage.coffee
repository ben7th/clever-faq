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
        <Button type='primary' onClick={-> App.link_demo.toggle_text()}>切换文本显示</Button>
      </div>
      <div>
        <Button style={marginRight: '1rem'} type='primary' onClick={-> App.link_demo.show_modal('open')}>弹出提示框</Button>
        <Button style={marginRight: '1rem'} type='primary' onClick={-> App.link_demo.show_modal('close')}>关闭提示框</Button>
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
      <QiangJinJiu />
      <ShowModal />
    </div>

QiangJinJiu = React.createClass
  getInitialState: ->
    texts: [
      '君不见，黄河之水天上来，奔流到海不复回。'
      '君不见，高堂明镜悲白发，朝如青丝暮成雪。'
      '人生得意须尽欢，莫使金樽空对月。'
      '天生我材必有用，千金散尽还复来。'
      '烹羊宰牛且为乐，会须一饮三百杯。'
      '岑夫子，丹丘生，将进酒，杯莫停。'
      '与君歌一曲，请君为我倾耳听。'
      '钟鼓馔玉不足贵，但愿长醉不复醒。'
      '古来圣贤皆寂寞，惟有饮者留其名。'
      '陈王昔时宴平乐，斗酒十千恣欢谑。'
      '主人何为言少钱，径须沽取对君酌。'
      '五花马，千金裘，呼儿将出换美酒，与尔同销万古愁。'
    ]
    idx: 0

  render: ->
    text = @state.texts[@state.idx]
    <h1>{text}</h1>

  toggle: ->
    idx = @state.idx
    idx = (idx + 1) % @state.texts.length
    @setState idx: idx

  componentDidMount: ->
    jQuery(document).off('link-demo:toggle-text').on 'link-demo:toggle-text', =>
      @toggle()

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
      content: '你用手机操作打开了一个对话框'
    }

  close: ->
    return if not @state.modal?
    @state.modal.destroy()
    @setState modal: null

  componentDidMount: ->
    jQuery(document).off('link-demo:show-modal').on 'link-demo:show-modal', (evt, message)=>
      switch message.oper
        when 'open'
          @open()
        when 'close'
          @close()