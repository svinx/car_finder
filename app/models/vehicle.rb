class Vehicle < ActiveRecord::Base
  attr_accessible :dealer_id, :listed, :make, :model, :price,
                  :year, :description, :mileage, :vin, :city_mpg,
                  :highway_mpg, :transmission, :body, :exterior_color,
                  :interior_color, :drivetrain, :car_type, :cylinders,
                  :images

  validates :dealer_id,   :presence => true
  validates :year,        :presence => true
  validates :make,        :presence => true
  validates :model,       :presence => true
  validates :car_type,    :presence => true
  validates :description, :presence => true
  validates :vin,         :presence => true

  belongs_to :dealer
  has_one :vehicle_statistic

  def to_param
    "#{id} #{make} #{model}".parameterize
  end

end
