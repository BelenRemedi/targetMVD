class ChatsController < ApplicationController
  before_action :authenticate_user!
  before_action :get_messages

  def index
    @message = Message.new
  end

  def show; end

  def edit; end

  def update; end

  def create
    #chat = current_user.chats.new
  end
  def load_chat
    #tienen que ser los msjs del chat que selecciona(un receiver_id determinado)
    @messages = Message.for_display
    @message = Message.new
    render json: { form: (render_to_string 'index', layout: false) }
  end

  private

    def get_messages
      #tienen que ser los msjs del chat que selecciona(un receiver_id determinado)
      @messages = Message.for_display
      #@message = Message.first
    #  user_chat = Chat.first
    #  @message  = current_user.chats.find(user_chat.id).messages.new
    end

end
