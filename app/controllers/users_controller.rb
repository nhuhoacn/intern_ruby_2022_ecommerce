class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show; end

  def edit; end

  def create
    @user = User.new user_params
    if @user.save
      @user.send_mail_activate
      flash[:info] = t ".mail_notice"
      redirect_to root_path
    else
      flash.now[:danger] = t ".users_unsuccess"
      respond_to do |format|
        format.html{redirect_to @user}
        format.js
      end
    end
  end

  def destroy; end

  private

  def user_params
    params.require(:user).permit User::USER_ATTRIBUTES
  end
end
