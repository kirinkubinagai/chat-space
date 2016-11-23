class ChatGroupsController < ApplicationController

  before_action :group,only: [:edit,:update]
  def index
    @chat_groups = current_user.chat_groups
  end

  def new
    @chat_group = ChatGroup.new
  end

  def create
    @chat_group = ChatGroup.new(chat_group_params)
    if @chat_group.save
      redirect_to action: :index
    else
      render action: :new
    end
  end

  def edit
  end

  def update
    if @chat_group.update(create_params)
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
