class UsersController < ApplicationController

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
end
