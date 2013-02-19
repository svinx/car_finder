class Dealer < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :inventory_id, :email, :phone, :dealership, :address, :city, 
                  :state, :zip, :password, :password_confirmation, :remember_me,
                  :logo, :replies, :payment_id, :account_current, :cell_phone
  # attr_accessible :title, :body

  has_many   :vehicles
  has_many   :delivered_leads

end
