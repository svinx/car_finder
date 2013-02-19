module DealerVehiclesHelper

  def get_total_impressions
    dealer = Dealer.find(session["warden.user.dealer.key"][1].first)
    total_impressions = 0
    dealer.vehicles.each do |v|
      next if v.vehicle_statistic.nil?
      next if v.vehicle_statistic.impressions.nil?
      total_impressions += v.vehicle_statistic.impressions
    end
    total_impressions
  end

  def get_total_views
    dealer = Dealer.find(session["warden.user.dealer.key"][1].first)
    total_views = 0
    dealer.vehicles.each do |v|
      next if v.vehicle_statistic.nil?
      next if v.vehicle_statistic.views.nil?
      total_views += v.vehicle_statistic.views
    end
    total_views
  end

end
