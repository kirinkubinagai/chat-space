class ChatGroupsController < ApplicationController

  before_action :group,only: [:edit,:update]
  def index
    @chat_groups = current_user.chat_groups.order("created_at DESC")
  end

  def new
    @chat_group = ChatGroup.new
  end

  def create
    @chat_group = ChatGroup.new(chat_group_params)
    @users = User.all
    if @chat_group.save
      redirect_to controller: :chat_groups,action: :index
      flash[:notice] = "グループを作成しました。"
    else
      flash.now[:alert] = "グループ名を入力してください"
      render action: :new
    end
  end

  def edit
    @chat_group = ChatGroup.find(params[:id])
    @users = User.all
  end

  def update
    if @chat_group.update(chat_group_params)
      redirect_to action: :index
    else
      render action: :edit
    end
  end

  private
  def chat_group_params
     params.require(:chat_group).permit({user_ids:[]}, :name)
  end

  def group
    @chat_group=ChatGroup.find(params[:id])
  end
end
