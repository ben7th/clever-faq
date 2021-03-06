class MessageBroadcastJob < ApplicationJob
  queue_as :default

  # 根据 message 确定接收者
  # 每个接收者一个频道
  def perform(message_data)
    logger.info message_data

    message = ChatMessage.find(message_data[:message_id])
    receivers = message.receivers

    channels = receivers.map { |x|
      "member_channel_#{x.id}"
    }

    logger.info channels

    # 数据包装格式
    # message = {
    #   id: '...'
    #   time: '...'
    #   talker: {
    #     member_id: '...'
    #     name: '...'
    #   }
    #   content: {
    #     text: '...'
    #   }
    # }

    data = message.client_data

    channels.each do |cname|
      ActionCable.server.broadcast cname, data
    end
  end
end