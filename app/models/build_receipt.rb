class BuildReceipt

  def initialize(dealer, charge_info)
    @dealer, @payment_info = dealer, charge_info
  end

  def send
    @send_receipt = SendReceipt.new( get_receipt_info )
    NotificationsMailer.send_receipt(@dealer.email, @send_receipt).deliver
  end

  private

  def get_receipt_info
    {
    :dealership         => @dealer.dealership,
    :email              => @dealer.email,
    :transaction_number => @payment_info["id"],
    :amount             => @payment_info["data"]["object"]["amount"]
    }
  end

end
