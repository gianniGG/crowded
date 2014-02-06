class ProjectsController < ApplicationController
  respond_to :html, :json

  def home
  end

  def new
    @project = Project.new
  end

  def create
    @user = current_user
    @project = Project.create(project_params)
    @project.users << @user
    @project.creator = @user.name

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
    respond_with(@projects = Project.all)
  end

  def show
    respond_with(@projects = Project.all)
  end

  private
    def project_params
      {name: params[:project][:name], mission_statement: params[:project][:mission_statement], hashed_id: params[:project][:hashed_id]}
    end
end
