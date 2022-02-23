class DockingStation
  attr_reader :stored_bikes

  def initialize
    @stored_bikes = []
  end

  def release_bike 
     bike = Bike.new

     return bike
  end

  def docking_bike(bike)
    @stored_bikes << bike
  end
end

class Bike
  def working?
    true
  end
end