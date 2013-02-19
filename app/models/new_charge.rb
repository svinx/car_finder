require 'json'

class NewCharge

  def initialize(event)
    @event_json = JSON.parse(event)
    Rails.logger.info "=============================="
    Rails.logger.info "EVENT: #{@event_json}"
    Rails.logger.info "=============================="
    @dealer = Dealer.find_by_payment_id(@event_json["data"]["object"]["id"])
  end

  def process
    if @event_json["type"] == 'charge.succeeded' then set_account_to_paid end
    if @event_json["type"] == 'charge.failed' then set_account_to_overdue end
  end

  private

  def set_account_to_paid
    @dealer.account_current = true
    @dealer.save!
    BuildReceipt.new(@dealer, @event_json).send 
  end

  def set_account_to_overdue
    @dealer.account_current = false
    @dealer.save!
    NotificationsMailer.payment_failure_notice(@dealer).deliver
  end

end
