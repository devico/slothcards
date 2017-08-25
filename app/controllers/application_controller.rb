class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def authenticate
    render json: {errors: 'Unauthorized'}, status: 401 unless current_user
  end
 
  def current_user
    @current_user ||= Jwt::UserAuthenticator.(request.headers)
  end

  private

  def not_authenticated
    redirect_to login_url, :alert => "First login to access this page"
  end
end
