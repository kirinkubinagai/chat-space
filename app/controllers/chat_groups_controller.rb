class ChatGroupsController < ApplicationController

  def index
  end

  def new
  end

  def create
    Chat_group.create(name: create_params[:name],user_id: create_params[:user_id])
  end

  def edit
  end

  def show
  end

  private
  def create_params
     params.permit(:name,:user_id)
  end

end
