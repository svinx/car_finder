class SoldVehiclesController < ApplicationController
  after_filter :log_impression, :only=> [:index]

  def index
    @makes    = (Vehicle.where(:listed => false).select(:make).uniq.map {|m| m.make}).sort
    @vehicles = Vehicle.where(:listed => false).paginate(:page => params[:page],
                                                        :per_page => 10).order('id DESC')
    @title    = "Find My Next Car In Utah"
  end

  private

  def log_impression
    UpdateStats.new(current_dealer).log_impressions(@vehicles)
  end

end
