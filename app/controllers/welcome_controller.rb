class WelcomeController < ApplicationController
  before_action :authenticate_user!
  helper_method :current_user_id

  def index
    @chats = Chat.where(receiver_id: current_user_id).or(Chat.where(sender_id: current_user_id))
    @current_user_id = current_user_id
  end

  def current_user_id
    @current_user_id ||= current_user.id
  end
end
