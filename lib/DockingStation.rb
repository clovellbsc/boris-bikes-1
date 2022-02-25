require "bike.rb"

class DockingStation
  attr_reader :stored_bikes
  attr_reader :CAPACITY

  def initialize(capacity =20)
    @stored_bikes = []
    @CAPACITY = capacity
  end

  def release_bike
    raise NoBikeError if empty?
    raise 'Bike is broken' unless @stored_bikes[-1].working?
    @stored_bikes.pop
  end

  def docking_bike(bike)
    raise DockFullError if full?
    @stored_bikes << bike 
  end

  private

  def full?
    @stored_bikes.count >= @CAPACITY
  end

  def empty?
    @stored_bikes.empty?
  end
end



class NoBikeError < StandardError
end

class DockFullError < StandardError
end