class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      flash[:success] = "Welcome, #{user.email}!"
      redirect_to root_path
    else
      flash[:error] = "Sorry, your credentials are bad."
      render :new
    end
  end
end
