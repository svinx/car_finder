class UpdateStats

  def initialize(dealer)
    if dealer.nil?
      @dealer_id = nil
    else
      @dealer_id = dealer.id
    end
  end


  def log_impressions(vehicles)
    vehicles.each do |vehicle|
      next if vehicle.dealer_id == @dealer_id
      impression_for(vehicle)
    end
  end

  def log_view(vehicle)
    unless vehicle.dealer_id == @dealer_id
      view_for(vehicle)
    end
  end


 private
 
 def impression_for(vehicle)
   vs = VehicleStatistic.find_or_create_by_vehicle_id(:vehicle_id => vehicle.id)
   if vs.impressions.nil?
     vs.impressions = 1
   else
   vs.impressions += 1
   end
   vs.save!
 end

 def view_for(vehicle)
   vs = VehicleStatistic.find_or_create_by_vehicle_id(:vehicle_id => vehicle.id) 
   if vs.views.nil?
     vs.views = 1
   else
     vs.views += 1
   end
   vs.save!
 end

end
