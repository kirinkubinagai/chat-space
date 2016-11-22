class MessagesController < ApplicationController

  def index
  end

  def new
    @messages = Message.all
    @message = Message.new
    @chat_groups = ChatGroup.where(user_id: current_user.id)
  end

  def create
    Message.create(crete_params)
    redirect_to action: :index
  end

private
  def create_params
  end
end
