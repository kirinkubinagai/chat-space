class ChatGroupsController < ApplicationController

  def index
  end

  def new
    @chat_group=ChatGroup.new
  end

  def create
    ChatGroup.create(create_params)
    redirect_to action: :index
  end

  def edit
  end

  def show
  end

  private
  def create_params
     params.require(:chat_group).permit({user_id:[]}, :name)
  end

end
