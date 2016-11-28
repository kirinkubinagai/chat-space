class MessagesController < ApplicationController

  def new
    @chat_groups = current_user.chat_groups.order("created_at DESC")
    @chat_group = ChatGroup.find(params[:chat_group_id])
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    if @message.save
      respond_to do |format|
        format.html { redirect_to action: :new } # この中はHTMLリクエストの場合に呼ばれる
        format.json {
          render json: {
           id: @message.id, chat_group_id: @message.chat_group_id, body: @message.body,created_at: @message.created_at, user_id: @message.user_id, image: @message.image, name: current_user.name 
         }
        }# この中はJSONリクエストの場合に呼ばれる
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
