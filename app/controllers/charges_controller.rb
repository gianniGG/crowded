class ChargesController < ApplicationController
  def new
  end

  def create
    # Amount in cents
    @amount = 100
    @project = Project.find(params[:project_id])
    @project.funds += @amount

    Donation.create(amount: @amount, user: current_user, project: @project, points: @amount/100)

    customer = Stripe::Customer.create(
      :email => 'example@stripe.com',
      :card  => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @amount,
      :description => 'Rails Stripe customer',
      :currency    => 'gbp'
    )

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to charges_path
  end
end
