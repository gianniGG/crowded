class DonationsController < ApplicationController

  def create
    @user = current_user
    @project = Project.find(params[:project_id])
    Donation.create(amount: 100, project: @project, user: current_user, points: 1)

    WebsocketRails[:project_donation].trigger 'new', {id: @project.id,
                                                  funds_raised: @project.donations_total,
                                                  recent_donors: @project.recent_five }

    WebsocketRails[:user_donation].trigger 'new', {id: @user.id,
                                                  points: @user.points}

    redirect_to project_path(@project)
  end

end
