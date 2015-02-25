class AccessController < ApplicationController

  before_action :prevent_login_signup, only: [:signup, :login]

  def home
    #goes to erb
  end

  def create
    @user = User.create(user_params)
      if @user.save
        session[:user_id] = @user.id
        redirect_to home_path, notice: "You created a user's account."
      else
        render :signup
      end
  end

  def signup
    @user = User.new
    #goes to erb
  end

  def attempt_login
    if params[:username].present? && params[:password].present?
      found_user = User.where(username: params[:username]).first
      if found_user
        authorized_user = found_user.authenticate(params[:password])
        if authorized_user
          render :home, notice: "You are logged in."
        else
          redirect_to login_path, notice: "Incorrect password."
        end
      else
        redirect_to login_path, notice: "Incorrect username."
      end
    end
  end

  def logout
    session[:user_id] = nil
    render :logout
  end

  private
  def user_params
    params.require(:user).permit(:username, :password, :password_digest)
  end

#see if the user is logged in and if so redirect them back to home
  def prevent_login_signup
    if session[:user_id]
      redirect_to home_path
    end
  end

end