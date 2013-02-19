require 'redcarpet'

module ApplicationHelper

  def markdown(text)
    options = {:autolink => true, :space_after_headers => true}
    Redcarpet::Markdown.new(Redcarpet::Render::HTML, options ).render(text).html_safe
  end

  def title
    base_title = "Used Cars In Utah | Car Compass"
    if @title.nil?
      base_title
    else
      @title
    end
  end

  def keywords
    base_keywords = "Cars, Trucks, Utah, Used Cars, Used Trucks, Salt Lake City, Provo, Ogden, Sandy, Financing, Car Loans"
    if @keywords.nil?
      base_keywords
    else
      @keywords
    end
  end

  def description
    base_description = "Car Compass helps buyers find their next car or truck. We offer realtime vehicle search both online and through text message."
    if @description.nil?
      base_description
    else
      @description
    end
  end

  def random_vehicle
    Vehicle.where(:listed => true).sample
  end

  def dealer_billing_not_current?(dealer_id)
    dealer = Dealer.find(dealer_id)
    not_current = case dealer.account_current
                  when false then true
                  when nil   then true
                  else
                    false
                  end
    not_current
  end

  def current_dealers_inventory?
    if current_dealer.id == session["warden.user.dealer.key"][1].first
      true
    else
      false
    end
  end

end
