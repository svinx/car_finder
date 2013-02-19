class Buyer < ActiveRecord::Base
  attr_accessible :make, :model, :phone, :miles, :low_year, :high_year, :color, :contact_me, :ip

  validates :phone, :presence => true
  validates :make,  :presence => true
  validates :ip,    :presence => true

  MILES_OPTIONS = [["Low","low"],["Moderate","moderate"],["High","high"]]
end
