class ProjectsController < ApplicationController
  respond_to :html, :json

  def home
  end

  def new
    @project = Project.new
    render :layout => false
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
      {company: current_company, name: params[:project][:name],
        headline: params[:project][:headline],
        hashed_id: params[:project][:hashed_id],
        funds_raised: params[:project][:funds_raised],
        target: params[:project][:target],
        duration: params[:project][:duration],
        project_info: params[:project][:project_info],
        company_id: params[:project][:company_id]}
    end
end
