require "bike.rb"

class DockingStation
  attr_reader :stored_bikes

  def initialize
    @stored_bikes = []
  end

  def release_bike
    raise NoBikeError if empty?
    @stored_bikes.pop
  end

  def docking_bike(bike)
    raise DockFullError if full?
    @stored_bikes << bike 
  end

  private

  def full?
    @stored_bikes.count >= 20
  end

  def empty?
    @stored_bikes.empty?
  end
end



class NoBikeError < StandardError
end

class DockFullError < StandardError
end