class ChatsController < ApplicationController
  before_action :authenticate_user!

  def index; end

  def load_chat
    chat = Chat.find(params[:chat_id])
    messages = chat.messages.order(id: :asc)
    messages.where.not(user_id: current_user.id).update_all seen: true
    message = Message.new
    render json: { form: (render_to_string 'index', layout: false, locals: { chat: chat,
                                                                             messages: messages,
                                                                             message: message }) }
  end
end
