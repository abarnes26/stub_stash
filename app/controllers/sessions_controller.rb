class SessionsController < ApplicationController

  def new

  end

  def create
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      flash[:notice] = "Login Successful!"
      # verify_admin
      redirect_to user_shows_path
    else
      render :new
    end
  end

  def destroy
    session.clear
    flash[:notice] = "You have successfully logged out"
    redirect_to root_path
  end

end
