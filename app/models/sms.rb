require 'twilio-ruby'

class Sms

  attr_reader :sid, :token, :from, :client

  def initialize
    @sid   = CarCompass::Application.config.account_sid
    @token = CarCompass::Application.config.auth_token
    @from  = CarCompass::Application.config.from
    @client = Twilio::REST::Client.new @sid, @token
  end

  def text_buyer(buyer, dealers_number)
    dealer = Dealer.where(:cell_phone => dealers_number[2..12]).last
    if dealer.replies.nil?
      dealer.replies = 0
    else
      dealer.replies += 1
    end
    dealer.save
    body = "Hello, we found your #{buyer.make.capitalize} #{buyer.model.capitalize} at #{dealer.dealership.capitalize}. They're at #{dealer.address}, #{dealer.city.capitalize}. Call them at, #{dealer.phone}."
    send_text(buyer.cell_phone, body)
  end

  def text_dealers(buyer)
    body = "#{buyer.low_year}-#{buyer.high_year} #{buyer.make.capitalize} #{buyer.model.capitalize}, #{buyer.color.capitalize}, #{buyer.miles} miles (uid:#{buyer.id})"
    Dealer.where(:account_current => true).each do |dealer|
      send_text(dealer.cell_phone, body)
      DeliveredLead.create!(:dealer_id => dealer.id, :buyer_id => buyer.id)
    end
  end

  def ask_dealer_to_resend(from)
    body = "We couldn't find the uid, can you please resend a response with it?"
    send_text(from, body)
  end

  private

  def send_text(to, body)
    @client.account.sms.messages.create(
      :from => @from,
      :to   => to,
      :body => body
    )
  end

end
