class ProjectsController < ApplicationController

  def new
    @project = Project.new
  end

  def create
    if @project.save
      flash[:notice] = 'Mission launched!'
      redirect_to user_path(current_user)
    else
      render 'new'
    end
  end

  def edit
  end

  def update
  end

  def index
  end

end
