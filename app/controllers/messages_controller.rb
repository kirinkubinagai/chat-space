
class MessagesController < ApplicationController

  def new
    @chat_groups = current_user.chat_groups
    @users = @chat_groups.find(params[:chat_group_id]).users
    @chat_group = ChatGroup.find(params[:chat_group_id])
    @messages = @chat_group.messages.order("created_at DESC")
    @message = Message.new
  end

  def create
    @message=Message.new(create_params)
    if @message.save
      redirect_to action: :new
    else
      redirect_to action: :new
      flash[:alert]="入力してください"
    end
  end

private
  def create_params
    params.require(:message).permit(:body).merge(user_id: current_user.id,chat_group_id: params[:chat_group_id])
  end
end
