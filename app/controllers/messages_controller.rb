class MessagesController < ApplicationController

  def create
    puts 'createee'
    #chat= Chat.create(receiver_id: 3, sender_id: 2, topic_id: 2)
    #message = chat.messages.create(message_params)
    message = Chat.first.messages.create(message_params)
    if message.save
      ActionCable.server.broadcast 'room_channel',
                                   #content:  message.body,
                                   #username: current_user.name
                                   message: render_message(message)

      message.mentions.each do |mention|
        ActionCable.server.broadcast "room_channel_user_#{mention.id}",
                                        mention: true
      end
      puts 'saveeee'
    else
      puts 'indexxxx'
      render 'index'
    end
  end

  def message_params
    params.require(:message).permit(:body)
  end

  def render_message(message)
      render(partial: 'message', locals: { message: message })
  end
end
