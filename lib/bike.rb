class Bike
  def initialize
    @working = true
  end

  def break!
    @working =false
  end

  def working?
    @working
  end

end
