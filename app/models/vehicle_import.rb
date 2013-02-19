require 'net/ftp'
require 'csv'


class VehicleImport

  def initialize
    @ftp_login = ENV['FTP_LOGIN']
    @ftp_pass  = ENV['FTP_PASS']
    @strategy = "homenet"
  end

  def process
    initialize_connection
    download_file
    active_vins
    updates_inactive_vehicles
    update_price_on_existing_vehicles
    create_vehicles
  end


  private

  def initialize_connection
    @ftp = Net::FTP.new('ftp.carcompasscloud.com')
    @ftp.login(@ftp_login, @ftp_pass)
    @ftp.passive = true
    @ftp.chdir(@strategy)
  end

  def download_file
    @ftp.getbinaryfile('homenet_data.csv')
  end

  def active_vins
    @active_vins = []
    Vehicle.where(:listed => true).all.each do |v|
      @active_vins << v.vin
    end
  end

  def drivetrain_check(drivetrain)
      case drivetrain
      when "awd", "AWD"
        drivetrain = "all wheel drive"
      when "rwd", "RWD"
        drivetrain = "rear wheel drive"
      when "fwd", "FWD"
        drivetrain = "front wheel drive"
      when "4wd", "4WD"
        drivetrain = "4 wheel drive"
      end

      drivetrain
  end

  def check_price(price)
    unless !price.nil?
      price = 0
    end
    price
  end

  def check_to_downcase(car_info)
    unless car_info.nil?
      car_info.downcase
    end
  end

  def incoming_vins
    @incoming_vins = []
    CSV.foreach("./homenet_data.csv", {:headers => true, :header_converters => :symbol})  do |vehicle|
      @incoming_vins << vehicle[:vin]
    end
  end

  def updates_inactive_vehicles
    incoming_vins
    @active_vins.each do |vin|
      if !@incoming_vins.include?(vin)
        vehicle = Vehicle.where(:vin => vin).last
        Rails.logger.info "Setting VIN: #{vin} to UnListed"
        vehicle.listed = false
        vehicle.save
      end
    end
  end

  def update_price_on_existing_vehicles
    CSV.foreach("./homenet_data.csv", {:headers => true, :header_converters => :symbol})  do |vehicle|
      if vehicle_to_update = Vehicle.find_by_vin(vehicle[:vin])
        vehicle_to_update.price   = vehicle[:sellingprice]
        vehicle_to_update.save
      else
        next
      end
    end
  end

  def create_vehicles
    #begin
    CSV.foreach("./homenet_data.csv", {:headers => true, :header_converters => :symbol})  do |vehicle|
      if @active_vins.include?(vehicle[:vin])
        Rails.logger.info "VIN: #{vehicle[:vin]} is already Listed"
        next
      elsif vehicle[:dealer_id] == 'DemoDealer'
        next
      else
        dealer = Dealer.find_by_inventory_id(vehicle[:dealer_id])
        Rails.logger.info "Creating new vehicle, VIN: #{vehicle[:vin]}"
        Vehicle.create(:dealer_id       => dealer.id,
                       :listed          => true,
                       :price           => check_price(vehicle[:sellingprice]),
                       :year            => check_to_downcase(vehicle[:year]),
                       :make            => check_to_downcase(vehicle[:make]),
                       :model           => check_to_downcase(vehicle[:model]),
                       :description     => check_to_downcase(vehicle[:description]),
                       :mileage         => vehicle[:miles],
                       :vin             => vehicle[:vin],
                       :city_mpg        => vehicle[:city_mpg],
                       :highway_mpg     => vehicle[:highway_mpg],
                       :transmission    => check_to_downcase(vehicle[:transmission]),
                       :body            => check_to_downcase(vehicle[:body]),
                       :exterior_color  => check_to_downcase(vehicle[:ext_color_generic]),
                       :interior_color  => check_to_downcase(vehicle[:int_color_generic]),
                       :drivetrain      => check_to_downcase(drivetrain_check(vehicle[:drivetrain])),
                       :car_type        => check_to_downcase(vehicle[:type]),
                       :cylinders       => vehicle[:enginecylinders],
                       :images          => UploadImage.new.transfer(vehicle[:imagelist].split(",").first, vehicle[:vin])["url"]
                      )
      end
    end
    #rescue
    #Rails.logger.info "There was an error"
    #CreateVehicleError
    #end
  end

end

#class CreateVehicleError < StandardError ; end
