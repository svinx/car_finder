class ChargesController < ApplicationController

  def new
    if !dealer_signed_in? then redirect_to root_path end
  end

  def create
    dealer_id = session['warden.user.dealer.key'][1].first
    token     = params[:stripeToken]

    if customer = Charge.new(dealer_id, token).save_payment
       flash[:notice] = "Thank you for joining Car Compass! The leads are on the way."
       redirect_to 'http://www.mycarcompass.com/thank-you/'
    else
      flash[:error] = e.message
      redirect_to :back
    end
  end


    #customer = Stripe::Customer.create(
      #:card => token,
      #:plan => "car_compass_1",
      #:email => dealer.email #get dealer.email
    #)

    #dealer.payment_id = customer.id
    #dealer.save

    #rescue Stripe::CardError => e
      #flash[:error] = e.message
      #redirect_to charges_path
    #end

    #@amount = 5000

    #Stripe::Charge.create(
      #:amount      => @amount,
      #:card        => params[:stripeToken],
      #:description => 'Rails Stripe customer',
      #:currency    => 'usd'
    #)

end
