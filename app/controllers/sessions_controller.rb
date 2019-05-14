class SessionsController < ApplicationController
  def new
  end

  def create
    if User.authenticate(params[:email], params[:password])
      user = User.find_by(email: params[:email], password: params[:password])
      session[:user_id] = user.id
      flash[:message] = "Welcome #{user.name}, you are logged in!"
      redirect_to users_path
    else
      render :new
    end
  end
end
