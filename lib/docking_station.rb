require_relative 'bike'

class DockingStation
  attr_reader :bike

  def release_bike
    fail "There are no bikes available" unless @bike
    @bike
  end

  def dock(bike)
    fail "Dock is full" if !@bike.nil?
    @bike = bike
  end
end
