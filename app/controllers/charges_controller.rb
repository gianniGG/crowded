class ChargesController < ApplicationController
  def new
  end

  def create
    # Amount in cents
    @amount = 100

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

    if params[:project_id]
      if current_user.funds < @amount
        flash[:alert] = "Insufficient funds in your account. Please add credit to your profile."
        redirect_to user_path(current_user)
      end
      @project = Project.find(params[:project_id])
      @project.update(funds: (@project.funds + @amount))
      current_user.update(points: (current_user.points + @amount/100), balance: (current_user.balance - @amount))
      Donation.create(amount: @amount, user: current_user, project: @project, points: @amount/100)
      redirect_to project_path(@project)
    end

    if params[:user_id]
      @user = User.find(params[:user_id])
      @user.update(balance: (@user.balance + @amount))
      flash[:notice] = "£#{@amount/100} added."
      redirect_to user_path(@user)
    end

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to charges_path
  end
end
