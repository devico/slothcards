class OauthsController < ApplicationController
  #skip_before_action :require_login

  # sends the user on a trip to the provider,
  # and after authorizing there back to the callback url.
  def oauth
    login_at(auth_params[:provider])
  end

  def callback

    provider = auth_params[:provider]
    if @user = login_from(provider)
      redirect_to root_path, :notice => "Logged in from #{provider.titleize}!"
    else
      begin
        @user = create_from(provider)
        # NOTE: this is the place to add '@user.activate!' if you are using user_activation submodule

        reset_session # protect from session fixation attack
        auto_login(@user)
        redirect_to root_path, :notice => "Logged in from #{provider.titleize}!"
      rescue
        redirect_to root_path, :alert => "Failed to login from #{provider.titleize}!"
      end
    end
  end

  private
    def auth_params
    params.permit(:code, :provider)
  end

end
# require 'oauth2'
# class OauthsController < ApplicationController
#   skip_before_action :require_login
#   before_action :require_login, only: :destroy


#   # sends the user on a trip to the provider,
#   # and after authorizing there back to the callback url.
#   def oauth
#     login_at(params[:provider])
#   end

#   def callback
#     provider = params[:provider]
#     begin
#     if @user = login_from(provider)
#       redirect_to root_path, :notice => "Logged in from #{provider.titleize}!"
#     else
#       begin
#         @user = create_from(provider)
#         @user.activate!
#         # reset_session # protect from session fixation attack
#         # auto_login(@user)
#         redirect_to root_path, :notice => "Logged in from #{provider.titleize}!"
#       rescue
#         redirect_to root_path, :alert => "Failed to login from #{provider.titleize}!"
#       end
#     end
#     rescue ::OAuth2::Error => e
#       p e
#       puts e.code
#       puts e.description
#       puts e.message
#       puts e.backtrace
#     end
#   end
# end
# class OauthsController < ApplicationController
#   #skip_before_action :require_login
#   before_action :require_login, only: :destroy

#   # sends the user on a trip to the provider,
#   # and after authorizing there back to the callback url.
#   def oauth
#     login_at(auth_params[:provider])
#   end

#   # this is where all of the magic happens
#   def callback
#     # this will be set to 'github' when user is logging in via Github
#     provider = auth_params[:provider]

#     if @user = login_from(provider)
#       # user has already linked their account with github

#       flash[:notice] = "Logged in using #{provider.titleize}!"
#       redirect_to root_path
#     else
#       # User has not linked their account with Github yet. If they are logged in,
#       # authorize the account to be linked. If they are not logged in, require them
#       # to sign in. NOTE: If you wanted to allow the user to register using oauth,
#       # this section will need to be changed to be more like the wiki page that was
#       # linked earlier.

#       if logged_in?
#         link_account(provider)
#         redirect_to root_path
#       else
#         flash[:alert] = 'You are required to link your GitHub account before you can use this feature. You can do this by clicking "Link your Github account" after you sign in.'
#         redirect_to login_path
#       end
#     end
#   end

#   # This is used to allow users to unlink their account from the oauth provider.
#   #
#   # In order to use this action you will need to include this route in your routes file:
#   # delete "oauth/:provider" => "oauths#destroy", :as => :delete_oauth
#   #
#   # You will need to provide a 'provider' parameter to the action, create a link like this:
#   # link_to 'unlink', delete_oauth_path('github'), method: :delete
#   def destroy
#     provider = params[:provider]

#     authentication = current_user.authentications.find_by_provider(provider)
#     if authentication.present?
#       authentication.destroy
#       flash[:notice] = "You have successfully unlinked your #{provider.titleize} account."
#     else
#       flash[:alert] = "You do not currently have a linked #{provider.titleize} account."
#     end

#     redirect_to root_path
#   end

#   private

#   def link_account(provider)
#     if @user = add_provider_to_user(provider)
#       # If you want to store the user's Github login, which is required in order to interact with their Github account, uncomment the next line.
#       # You will also need to add a 'github_login' string column to the users table.
#       #
#       # @user.update_attribute(:github_login, @user_hash[:user_info]['login'])
#       flash[:notice] = "You have successfully linked your GitHub account."
#     else
#       flash[:alert] = "There was a problem linking your GitHub account."
#     end
#   end

#   def auth_params
#     params.permit(:code, :provider)
#   end
# end
