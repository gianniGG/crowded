class UsersController < ApplicationController
  respond_to :html, :json

  # before_action :signed_in?

  def index
  end

  def show
    @user = User.find(params[:id])
  end

  def interests
    @user = User.find(params[:id])
    @interests = @user.projects
  end

  def dashboard
    respond_with(@user = User.find(params[:id]))
  end


  private
    def signed_in?
      !current_user.nil?
    end
end
