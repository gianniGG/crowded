class ProjectsController < ApplicationController

  def new
    @project = Project.new
  end

  def create
    @user = current_user
    @project = Project.create(project_params)
    @project.users << @user
    @project.creator_id = @user.id

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
    @projects = Project.all
  end

  def show
  end

  private
    def project_params
      {name: params[:project][:name], mission_statement: params[:project][:mission_statement]}
    end
end
