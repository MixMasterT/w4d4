class UsersController < ApplicationController

  def new
    @current_user = current_user
    render :new
  end

  def create
    @current_user = User.new(user_params)
    if @current_user.save
      login_user!(@current_user)
      redirect_to user_url(@current_user)
    else
      flash[:errors] = @current_user.errors.full_messages
      render :new
    end
  end

  def show
    if logged_in?
      @current_user = current_user
      if @current_user.id == params[:id].to_i
        render :show
      else
        redirect_to user_url(@current_user)
      end
    else
      redirect_to new_session_url
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
