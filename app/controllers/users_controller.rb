class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      token = Jwt::TokenProvider.(user_id: @user.id)
      # render json: {user: user, token: token}
      redirect_to root_url, :notice => "Signed up!"
    else
      # render json: {error: 'Error description'}, status: 422
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
