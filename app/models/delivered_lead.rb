class DeliveredLead < ActiveRecord::Base
  attr_accessible :buyer_id, :dealer_id

  validates :dealer_id, :presence => true
  validates :buyer_id, :presence => true 

  belongs_to :dealer
end
