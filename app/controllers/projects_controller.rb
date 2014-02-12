class ProjectsController < ApplicationController
  respond_to :html, :json

  def home
    @projects = Project.last(3)
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.create(project_params)
    if @project.save
      flash[:notice] = 'Mission launched!'
      redirect_to projects_path
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
    respond_with(@project = Project.find(params[:id]))
  end

  private
    def project_params
      {company: current_company, name: params[:project][:name], headline: params[:project][:headline], hashed_id: params[:project][:hashed_id]}
    end
end
