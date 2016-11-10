require_relative 'bike'

class DockingStation
  attr_reader :bike
  attr_reader :bikes

  def initialize(dock_capacity = 20)
    @dock_capacity = dock_capacity
    @bikes = 0
  end

  def release_bike
    fail "There are no bikes available" unless @bike
    @bike
  end

  def dock(bike)
    fail "Dock is full" unless (@bikes < @dock_capacity)
    @bikes += 1
    @bike = bike
  end
end
