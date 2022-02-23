class DockingStation
  attr_reader :stored_bikes

  def initialize
    @stored_bikes = []
  end

  def release_bike
    raise NoBikeError if @stored_bikes.empty? 
    @stored_bikes.pop
  end

  def docking_bike(bike)
    raise DockFullError unless @stored_bikes.count < 20
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