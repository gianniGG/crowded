class OmniauthCallbacksController < ApplicationController

  def authorize email_required=true
    user = User.auth request.env["omniauth.auth"], email_required
    sign_in user
    redirect_to user_path(current_user)
  rescue ActiveRecord::RecordNotUnique
    flash[:alert] = 'User already exists with that email'
    redirect_to '/'
  end

  def twitter
    authorize false
    raise request.env['omniauth.auth'].inspect

  end

  def facebook
    authorize
  end

  def linkedin
    authorize
  end


end
