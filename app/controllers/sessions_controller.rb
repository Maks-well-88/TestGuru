class SessionsController < ApplicationController
  skip_before_action :authenticate_user!

  def new
  end

  def create
    user = User.find_by(email: params[:email])

    if user&.authentificate(params[:password])
      session[:user_id] = user.id
      redirect_to tests_path
    else
      flash.now[:alert] = 'Неверный логин или пароль!'
      render :new
    end
  end

  def logout
    session[:user_id] = nil
    redirect_to login_path
  end
end
