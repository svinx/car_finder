class EmailDealersController < ApplicationController

  def new
    @vehicle = Vehicle.find(params[:vid])
    @title   = "Email Seller About The #{@vehicle.make.titleize} #{@vehicle.model.titleize}"
  end

  def create
    @vehicle       = Vehicle.find(params[:vehicle][:vid])
    @email_dealer  = EmailDealer.new(params[:email_dealer])

    if @email_dealer.valid?
      NotificationsMailer.email_dealer(@vehicle.dealer.email, @email_dealer).deliver
      flash[:notice] = "Your message was sent successfully!"
      redirect_to dealer_vehicle_path(@vehicle.dealer_id, @vehicle.id)
    else
      flash[:alert] = "Please fill all fields"
      redirect_to :back
    end
  end

end


