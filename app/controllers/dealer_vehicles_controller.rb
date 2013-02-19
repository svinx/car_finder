class DealerVehiclesController < ApplicationController
  after_filter :log_impression, :only=> [:index]

  def index
    @makes    = (Dealer.find(params[:id]).vehicles.where(:listed => true).select(:make).uniq.map {|m| m.make}).sort
    @vehicles = Dealer.find(params[:id]).vehicles.where(:listed => true).paginate(:page => params[:page],
                                                                                  :per_page => 10).order('id DESC')
  end

  private

  def log_impression
    UpdateStats.new(current_dealer).log_impressions(@vehicles)
  end

end

