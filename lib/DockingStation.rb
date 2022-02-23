class DockingStation
  attr_reader :stored_bikes

  def initialize
    @stored_bikes = []
  end

  def release_bike
    return Bike.new unless @stored_bikes.empty? 
    raise NoBikeError
  end

  def docking_bike(bike)
    raise DockFullError unless @stored_bikes.length < 1
    @stored_bikes << bike 
    
  end
end

class Bike
  def working?
    true
  end
end

class NoBikeError < StandardError
end

class DockFullError < StandardError
end