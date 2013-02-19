class WelcomeReceipt

  def initialize(dealer)
    @dealer= dealer
  end

  def send
    @welcome_receipt = WelcomeReceipt.new( get_receipt_info )
    NotificationsMailer.welcome_receipt(@dealer.email, @wecome_receipt).deliver
  end

  private 

  def get_receipt_info
    {
    :dealership         => @dealer.dealership,
    :email              => @dealer.email,
    :transaction_number => 1000
    }
  end

end
