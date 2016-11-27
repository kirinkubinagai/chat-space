class MessagesController < ApplicationController

  def new
    @chat_groups = current_user.chat_groups
    @chat_group = ChatGroup.find(params[:chat_group_id])
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    if @message.save
      respond_to do |format|
        format.html { redirect_to action: :new } and return# この中はHTMLリクエストの場合に呼ばれる
        format.json { render json: @message } and return# この中はJSONリクエストの場合に呼ばれる
            redirect_to action: :new
      end
    else
      redirect_to action: :new
      flash[:alert] = "入力してください"
    end
  end

private
  def message_params
    params.require(:message).permit(:body).merge(user_id: current_user.id,chat_group_id: params[:chat_group_id])
  end
end
