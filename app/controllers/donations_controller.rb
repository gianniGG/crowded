class DonationsController < ApplicationController

  def create
    @project = Project.find(params[:project_id])
    Donation.create(amount: 100, project: @project, user: current_user)
    WebsocketRails[:donation].trigger 'new', {id: @project.id, funds_raised: @project.donations_total }

    redirect_to project_path(@project)
  end

end
