class BuyersController < ApplicationController
  include BuyersHelper

  def new
    if dealer_signed_in? then redirect_to dealer_inventory_path(session['warden.user.dealer.key'][1].first) end
    @title   = "Used Cars in Utah | Utah Used Trucks and SUVs"
    @content = "Search with a text message for your next new or used car, truck, or SUV in Utah."
    @buyer   = Buyer.new
  end

  def create
    format_buyer!
    @buyer = Buyer.new(params[:buyer])
    if @buyer.save
      Sms.new.text_dealers(@buyer)
      render :success
    else
      render :new
    end
  end

  def success
    @title = "We're looking for your Utah Car, Truck, or SUV"
    @content = "You will receive a text message when we find your new or used car or truck in Utah."
  end

end
