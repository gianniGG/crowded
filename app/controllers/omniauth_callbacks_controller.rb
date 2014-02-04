class OmniauthCallbacksController < ApplicationController

  def authorize api
    user = User.__send__("#{api}_auth", request.env["omniauth.auth"])
    sign_in_and_redirect user
  rescue ActiveRecord::RecordNotUnique
    flash[:alert] = 'User already exists with that email'
    redirect_to '/'
  end

  def twitter
    authorize 'twitter'
  end

  def facebook
    authorize 'facebook'
  end

  def linkedin
    authorize 'linkedin'
  end


end
