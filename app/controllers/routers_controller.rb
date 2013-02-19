class RoutersController < ApplicationController

  def response_sms
    @buyer = Buyer.where(:id => params[:Body].gsub(/[^\d]/, '').to_i).last
    if @buyer.nil?
      Sms.new.ask_dealer_to_resend(params[:From])
    else
      Sms.new.text_buyer(@buyer, params[:From])
    end
  end

end
