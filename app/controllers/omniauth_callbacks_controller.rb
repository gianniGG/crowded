class OmniauthCallbacksController < ApplicationController

  def twitter
    user = User.twitter_auth request.env["omniauth.auth"]
    sign_in_and_redirect user
  end

  def facebook

  end

  def linkedin

  end


end