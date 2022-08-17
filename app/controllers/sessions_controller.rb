class SessionsController < ApplicationController
  before_action :find_by_email, only: %i(create)

  def new; end

  def create
    if @user&.authenticate params[:session][:password]
      log_in @user
      redirect_to root_path
    else
      flash.now[:danger] = t ".invalid_email_password"
      respond_to do |format|
        format.html{redirect_to @user}
        format.js
      end
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_path
  end

  private

  def find_by_email
    @user = User.find_by email: params[:session][:email].downcase
    return if @user

    flash[:danger] = t ".user_not_found"
    redirect_to signup_path
  end
end
