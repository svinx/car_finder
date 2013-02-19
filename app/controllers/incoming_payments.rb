class IncomingPaymentsController < ApplicationController

  def create
    #NewCharge.new(request.body.read).process
    @charge = NewCharge.new(request.body.read)#.process
      if @charge.process
        render json: @charge
      else
        @charge = "ERROR"
        render json: @charge
      end
  end

end
