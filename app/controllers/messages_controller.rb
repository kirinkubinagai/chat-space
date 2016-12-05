class MessagesController < ApplicationController

  def index
    @chat_groups = current_user.chat_groups.order("created_at DESC")
    @chat_group = ChatGroup.find(params[:chat_group_id])
    @message = Message.new
    @messages = @chat_group.messages
    respond_to do |format|
      format.html
      format.json {
        render "index.json.jbuilder"
      }
    end
  end

  def create
    @message = Message.new(message_params)
    if @message.save
      respond_to do |format|
        format.html {}
        format.json {
          render json: {
            id:                 @message.id,
            body:               @message.body,
            created_at:         @message.created_at,
            user_id:            @message.user_id,
            image:              @message.image,
            name:               current_user.name
          }
        }# この中はJSONリクエストの場合に呼ばれる
      end
    else
      redirect_to chat_group_messages_path(params[:chat_group_id])
      flash[:alert] = "入力してください"
    end
  end

private
  def message_params
    params.require(:message).permit(:body,:image).merge(user_id: current_user.id, chat_group_id: params[:chat_group_id])
  end
end
