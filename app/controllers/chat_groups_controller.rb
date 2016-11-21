class ChatGroupsController < ApplicationController

  def index
  end

  def new
    @users=User.all
  end

  def create
    Chat_group.create(create_params)
  end

  def edit
  end

  def show
  end

  private
  def create_params
     params.require(:user).permit(:id => []).merge(name: params[:name])
  end

end
