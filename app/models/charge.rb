class Charge

  def initialize(dealer_id, stripe_token)
    @dealer = Dealer.find(dealer_id)
    @token  = stripe_token
  end

  def save_payment
    if customer = Stripe::Customer.create(
                   :card => @token,
                   :plan => "car_compass_1",
                   :email => @dealer.email
                   )
       @dealer.payment_id      = customer.id
       @dealer.account_current = true
       @dealer.save!
       WelcomeReceipt.new(@dealer).send
    else
      logger.error "Stripe error while creating customer: #{@dealer.email}"
      flash[:error] = "Error while creating payment for #{@dealer.email}"
      false
    end
  end

end
