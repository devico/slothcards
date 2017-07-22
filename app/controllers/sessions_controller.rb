class SessionsController < ApplicationController

  def index
  end

  def new
  end

  def create
    user = login(params[:email], params[:password], params[:remember_me])
    if user
      token = Jwt::TokenProvider.(user_id: user.id)
      # render json: {user: user, token: token}
      redirect_back_or_to root_url, :notice => "Logged in!"
    else
      # render json: {error: 'Error description'}, status: 422
      flash.now.alert = "Email or password was invalid"
      render :new
    end
  end

  def destroy
    if logged_in?
      logout
      redirect_to root_url, :notice => "Logged out!"
    end  
  end
end
