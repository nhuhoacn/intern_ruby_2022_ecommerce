class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      flash[:success] = t ".users_success"
      redirect_to root_path
    else
      flash[:danger] = t ".users_unsuccess"
      respond_to do |format|
        format.html{redirect_to @user}
        format.js
      end
    end
  end

  def user_params
    params.require(:user).permit User::USER_ATTRIBUTES
  end
end
