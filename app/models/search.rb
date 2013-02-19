class Search

  def initialize(params)
    @make = params.fetch :make, nil
    @price = params.fetch :price, nil
    @miles = params.fetch :miles, nil
  end

  def find
    if @make
      find_by_make
    elsif @price
      find_by_price
    else
      find_by_mileage
    end
  end

  private

  def find_by_make
    Vehicle.where(:make => @make, :listed => true)
  end

  def price_range
    case @price
    when "1"
      0..5000
    when "2"
      5001..10000
    when "3"
      10001..15000
    when "4"
      15001..20000
    when "5"
      20000..100000
    end
  end

  def find_by_price
    Vehicle.where(:price => price_range)
  end

  def mileage_range
    case @miles
    when "low"
      0..40000
    when "moderate"
      40001..80000
    when "high"
      80001..400000
    end
  end 

  def find_by_mileage
    Vehicle.where(:mileage => mileage_range)
  end
end
