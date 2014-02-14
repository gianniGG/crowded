class ProjectsController < ApplicationController
  respond_to :html, :json

  def home
    # render layout: false
    @projects = Project.last(3)
  end

  def new
    @project = Project.new
    # render :layout => false
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

  def search
    projects = Project.where('name ILIKE ?', "%#{params[:search]}%")
    render json: { projects: projects }.to_json
  end

  def index
    @projects = Project.last(100)
  end

  def show
    # render layout: false
    @project = Project.find(params[:id])
    respond_with @project do |format|
      format.html { render :layout => false }
    end
  end

  private
    def project_params
      {company: current_company,
        name: params[:project][:name],
        headline: params[:project][:headline],
        hashed_id: params[:project][:hashed_id],
        company_info: params[:project][:company_info],
        duration: params[:project][:duration],
        project_info: params[:project][:project_info],
        company_id: current_company.id,
        thumbnail: params[:project][:thumbnail]}
    end
end
