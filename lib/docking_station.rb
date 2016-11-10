require_relative 'bike'

class DockingStation
  attr_reader :bike
  attr_reader :bikes

  def initialize(dock_capacity = 20)
    @dock_capacity = dock_capacity
    @bikes = []
  end

  def release_bike
    fail "There are no bikes available" unless (@bikes.count > 0)
    return @bikes.shift
  end

  def dock(bike)
    fail "Dock is full" unless (@bikes.count < @dock_capacity)
    @bikes << bike
    return bike
  end
end
