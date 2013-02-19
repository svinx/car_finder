module BuyersHelper

  def format_buyer!
    check_for_spam
  end

  private

  def check_for_spam
    if params[:buyer]["last_car"] == "0"
      remove_spam_check!
      format_phone!
      add_ip_to_user!
    else
      Spam.create!("ip" => request.remote_ip)
    end 
  end

  def remove_spam_check!
    params[:buyer].delete("last_car")
  end

  def format_phone!
    phone = params[:buyer][:phone].scan(/\d+/).join("")
    if phone.length == 11
      phone = phone[1,10]
    end
    params[:buyer][:phone] = phone
  end

  def add_ip_to_user!
    params[:buyer] = params[:buyer].merge("ip" => request.remote_ip)
  end

end
