class CompaniesController < ApplicationController
  respond_to :html, :json

  def dashboard
    @company = Company.find(params[:id])
  end

  def new
    session[:company_signup] = true
    redirect_to user_omniauth_authorize_path(:linkedin)
  end

  def index
    @companies = Company.all
  end

  def show
    @company = Company.find(params[:id])
  end

  def edit
    @company = Company.find(params[:id])
  end

  def update
    @company = Company.find(params[:id])
    if @company.update_attributes company_params
      flash[:success] = 'Saved changes.'
      redirect_to @company
    else
      render 'edit'
    end
  end

end
