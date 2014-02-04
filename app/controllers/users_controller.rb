class UsersController < ApplicationController
  before_action :signed_in?

  def index
  end

  def show
    @user = User.find(params[:id])
    @projects = @user.projects
  end

  def interests
    @user = User.find(params[:id])
    @interests = @user.projects
  end

  private
    def signed_in?
      !current_user.nil?
    end
end
