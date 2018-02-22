class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "Congratulations! Your account has been created!"
      redirect_to dashboard_path
    else
      flash[:notice] = "User was not created"
      render :new
    end
  end

  def show
    if current_user
      @user = current_user
    else
      render_404
    end
  end

  private
    def user_params
      params.require(:user).permit(:email, :password)
    end

end
