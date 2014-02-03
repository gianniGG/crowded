class OmniauthCallbacksController < ApplicationController

  def twitter
    user = User.twitter_auth request.env["omniauth.auth"]
    sign_in_and_redirect user
  end

  def facebook
    user = User.facebook_auth request.env["omniauth.auth"]
  end

  def linkedin
    user = User.linkedin_auth request.env["omniauth.auth"]
  end


end
