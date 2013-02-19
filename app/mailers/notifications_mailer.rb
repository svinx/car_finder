class NotificationsMailer < ActionMailer::Base
  #default :from => "noreply@mycarcompass.com"
  #default :to => "info@mycarcompass.com"

  def new_message(message)
    @message = message
    mail(:to => "info@mycarcompass.com",
         :from => "noreply@carcompass.com",
         :subject => "Inquiry from Contact Page"
        )
  end

  def email_dealer(dealer_email, message)
    @message = message
    mail(:to => dealer_email,
         :from => "noreply@mycarcompass.com",
         :subject => "Lead from Car Compass"
        )
  end

  def send_receipt(dealer_email, message)
    @message = message
    mail(:to => dealer_email,
         :from => "info@mycarcompass.com",
         :subject => "Your Receipt From Car Compass"
        )
  end

  def welcome_receipt(dealer_email, message)
    @message = message
    mail(:to => dealer_email,
         :from => "info@mycarcompass.com",
         :subject => "Welcome To Car Compass!"
        )
  end

  def payment_failure_notice(dealer)
    @dealer = dealer
    mail(:to => @dealer.email,
         :from => "info@mycarcompass.com",
         :subject => "Your Account Is On Hold"
        )
  end

end

