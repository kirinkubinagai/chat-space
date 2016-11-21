class ChatGroupsController < ApplicationController

  def index
  end

  def new
    @chat_group=ChatGroup.new
  end

  def create
    @chat_group=ChatGroup.new(create_params)
    if @chat_group.save
      redirect_to action: :index
    end
      render action: :new
  end

  def edit
    @chat_groups=ChatGroup.new
  end

  private
  def create_params
     params.require(:chat_group).permit({user_id:[]}, :name)
  end

end
