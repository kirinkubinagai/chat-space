class UsersController < ApplicationController
  def search
    @users = User.where("name LIKE(?)","%#{params[:name]}%")
    respond_to do |format|
      format.html{ redirect_to new_chat_group_path }
      format.json{ render json: @users}
    end
  end

end
