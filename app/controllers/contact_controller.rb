class ContactController < ApplicationController

  def new
    @title   = "New and Used Cars Trucks SUV in Utah"
    @content = "Contact us with any questions you have about finding a car or truck in Utah."
    @message = Message.new
  end

  def create
    @message = Message.new(params[:message])

    if @message.valid?
      NotificationsMailer.new_message(@message).deliver
      flash[:notice] = "Message was successfully sent"
      redirect_to :back
    else
      flash.now.alert = "Please fill all fields."
      render :new
    end
  end

end

