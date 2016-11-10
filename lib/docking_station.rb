require_relative 'bike'

class DockingStation
  attr_reader :bike
  #attr_accessor :bikes

  def initialize(dock_capacity = 20)
    @dock_capacity = dock_capacity
    @bikes = []
  end

  def release_bike
    fail "There are no bikes available" unless (@bikes.count > 0)
    return @bikes.shift
  end

  def dock(bike)
    fail "Dock is full" if dock_full?
    @bikes << bike
    return bike
  end

  def dock_full?
    @bikes.count == @dock_capacity
  end
end
