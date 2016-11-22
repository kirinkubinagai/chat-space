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
    else
      render action: :new
    end
  end

  def edit
    @chat_group=ChatGroup.find(params[:id])
  end

  def update
    chat_group=ChatGroup.find(params[:id])
    if @group.update(create_params)
      redirect_to action: :index
    else
      render action: :new
    end
  end

  private
  def create_params
     params.require(:chat_group).permit({user_id:[]}, :name)
  end

end
