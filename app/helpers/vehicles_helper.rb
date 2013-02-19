module VehiclesHelper

  def impressions_for_car(stat)
    if stat.nil?
      "0"
    else
      get_clicks(stat.impressions)
    end
  end

  def clicks_for_car(stat)
    if stat.nil?
      "0"
    else
      get_views(stat.views)
    end
  end

  private

  def get_clicks(stat)
    if stat.nil?
      "0"
    else
      stat
    end
  end

  def get_views(stat)
    if stat.nil?
      "0"
    else
      stat
    end
  end

end
