class MessagesController < ApplicationController

  def new
    @chat_groups = current_user.chat_groups
    @chat_group = ChatGroup.find(params[:chat_group_id])
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    if @message.save
      redirect_to action: :new
    else
      redirect_to action: :new
      flash[:alert] = "入力してください"
    end
  end


  def login_admin(admin)
    @request.env["devise.mapping"] = Devise.mappings[:admin]
    sign_in admin
  end

  def login_user(user)
    @request.env["devise.mapping"] = Devise.mappings[:user]
    user.confirm!
    sign_in user
  end

private
  def message_params
    params.require(:message).permit(:body).merge(user_id: current_user.id,chat_group_id: params[:chat_group_id])
  end
end
