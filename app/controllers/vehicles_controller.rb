class VehiclesController < ApplicationController

  after_filter :log_view, :only=> [:show]
  after_filter :log_impression, :only=> [:index, :search]

  def index
    @makes    = (Vehicle.where(:listed => true).select(:make).uniq.map { |m| m.make }).sort
    @vehicles = Vehicle.where(:listed => true).paginate(:page => params[:page],
                                                        :per_page => 10).order('id DESC')
    @title    = "Utah Used Cars"
  end

  def show
    @vehicle          = Vehicle.find(params[:id])
    @title            = "#{@vehicle.car_type.titleize} #{@vehicle.make.titleize} #{@vehicle.model.titleize} For Sale In Utah"
    @car_compass_fact = CarCompassFact.all.sample
    @car_tip          = CarTip.where(:kind_of => @vehicle.car_type).last
    @about_make       = AboutMake.where(:make => @vehicle.make).last
  end

  def search
    @vehicles = Search.new(params).find.paginate(:page => params[:page],
                                                 :per_page => 10).order('id DESC')
    @makes    = (@vehicles.map {|v| v.make}).sort
  end

  private

  def log_impression
    UpdateStats.new(current_dealer).log_impressions(@vehicles)
  end

  def log_view
    UpdateStats.new(current_dealer).log_view(@vehicle)
  end

end
