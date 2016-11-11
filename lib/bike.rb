class Bike
  def initialize
    @working = true
  end

  def break!
    @working =false
    self
  end

  def working?
    @working
  end

end
