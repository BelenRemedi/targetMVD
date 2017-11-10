class WelcomeController < ApplicationController
  before_action :authenticate_user!

  def index
      @chats = Chat.where(sender_id: current_user.id)
      #@messages = Message.for_display
  end
end
