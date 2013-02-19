class VehicleStatistic < ActiveRecord::Base
  attr_accessible :impressions, :vehicle_id, :views

  belongs_to :vehicle
end
