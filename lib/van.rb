class Van

  attr_reader :bikes

  def initialize
    @bikes = []
  end

  def collect_broken_bikes(bikes)
    bikes.each{ |bike|
      @bikes << bike unless bike.working?
    }
    @bikes
  end

  def deliver_broken_bikes(bikes)
    @bikes.each { |broken_bike|
      bikes << broken_bike unless broken_bike.working?
    }
    nil
  end

  def deliver_working_bikes(bikes)
    @bikes.each{ |bike|
      bikes.push bike if bike.working?
    }
    @bikes.select!{|bike| !bike.working?}
    nil
  end
end
