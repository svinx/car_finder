class PagesController < ApplicationController

  def about #build this page
    @title       = "Find Cars Trucks SUV in Utah"
    @description = "We are the easy way to shop for a new or used car in Utah. Our realtime search messages you with the location of the car you're looking for."
    @keywords    = "Used Cars, New Cars, Car Compass, Buy Cars"
  end

  def car_articles
    @title       = "Info On Utah Used Cars Trucks"
    @description = "A directory of information for when you are searching for a new or used automobile in Utah."
    @keywords    = "Cars, Information, Buying Cars, Utah"
  end

  def how_it_works
    @title       = "How Car Compass Finds Utah Cars"
    @description = "We send messages to car dealerships across Utah to find the car or truck you are looking for."
    @keywords    = "Find Cars, New Cars, Used Cars, Utah, Salt Lake City, Provo, Ogden"
  end

  def privacy
    @title       = "Your Privacy At Car Compass - Find Utah Cars Trucks SUV"
    @description = "Our privacy policy for when you search for cars in Utah with Car Compass."
    @keywords    = "Car Compass, Privacy, Cars, Trucks, SUV"
  end

  def thank_you
    @title       = "Thank You - You're A Car Compass Subscriber"
    @description = "You've joined the Car Compass network of trusted car dealerships."
    @keywords    = "Cars, Trucks, Utah, Salt Lake City, Car Classifieds"
  end

end
