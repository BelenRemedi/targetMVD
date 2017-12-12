class WelcomeController < ApplicationController
  before_action :authenticate_user!
  helper_method :current_user_id

  def index
    @chats = Chat.where(receiver_id: current_user_id).or(Chat.where(sender_id: current_user_id))
    @current_user_id = current_user_id
    @results = chats_unread_messages(@chats)
  end

  def current_user_id
    @current_user_id ||= current_user.id
  end

  def update_chats
    chats = Chat.where(receiver_id: current_user_id).or(Chat.where(sender_id: current_user_id))
    chat = Chat.find(params[:chat_id])
    messages = chat.messages
    messages.where.not(user_id: current_user.id).update_all seen: true
    results = chats_unread_messages(chats)
    render json: { form: (render_to_string partial: 'home', locals: { chats: chats,
                                                                      current_user_id: current_user_id,
                                                                      results: results }) }
  end

  def load_chats
    chats = Chat.where(receiver_id: current_user_id).or(Chat.where(sender_id: current_user_id))
    results = chats_unread_messages(chats)
    render json: { form: (render_to_string partial: 'home', locals: { chats: chats,
                                                                      current_user_id: current_user_id,
                                                                      results: results }) }
  end

  private

  def chats_unread_messages(chats)
    results = {}
    chats.each do |c|
      unread_messages = c.unread_messages(current_user)
      results[c.id] = unread_messages
    end
    results
  end
end
