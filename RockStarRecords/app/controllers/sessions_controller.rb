class SessionsController < ApplicationController

  def new
    render :new
  end

  def create
    user = User.find_by_cred(session_params[:email], session_params[:password])
    if user
      login_user!(user)
      redirect_to user_url(user)
    else
      flash.now[:errors] = ['Invalid credentials']
      render :new
    end
  end

  def destroy
    logout!
    redirect_to new_session_url
  end

  private

  def session_params
    params.require(:user).permit(:email, :password)
  end
end
