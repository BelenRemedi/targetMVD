class MessagesController < ApplicationController
  def create
    message = Message.new(message_params.merge(user_id: current_user.id))
    if message.save
      destinatary = message.chat.destinatary(current_user)
      ActionCable.server.broadcast "room_channel_user_#{destinatary}",
                                   message: message,
                                   formattedTime: message.created_at_time
    else
      render :index
    end
  end

  def message_params
    params.require(:message).permit(:body, :user_id, :chat_id)
  end
end
