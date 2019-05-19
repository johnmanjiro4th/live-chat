class ChatChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'chat_channel'
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def post(data)
    Message.create! content: data['message'], user_id: data['user_id']
    ActionCable.server.broadcast('chat_channel', data)
  end
end
