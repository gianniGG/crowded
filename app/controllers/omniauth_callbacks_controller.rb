class OmniauthCallbacksController < ApplicationController

  def authorize email_required=true
    if session[:company_signup]
      company = Company.auth request.env["omniauth.auth"], email_required
      sign_in(company, scope: :company)

      session[:company_signup] = false
    else
      user = User.auth request.env["omniauth.auth"], email_required
      sign_in(user)
    end

    redirect_to current_user || current_company
  rescue ActiveRecord::RecordNotUnique
    flash[:alert] = 'User already exists with that email'
    redirect_to '/'
  end

  def twitter
    authorize false
  end

  def facebook
    authorize
  end

  def linkedin
    authorize
  end


end
