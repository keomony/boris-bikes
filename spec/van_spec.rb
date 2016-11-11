require 'van'
require 'bike'

describe Van do
  context "when collecting bikes" do

    it 'should respond to collect_broken_bikes method' do
      expect(subject).to respond_to :collect_broken_bikes
    end

    it 'should collect the broken bikes from the docking station' do
      expect(subject).to respond_to :bikes
    end

    it 'should respond to collect_broken_bikes with 1 argument' do
      expect(subject).to respond_to(:collect_broken_bikes).with(1).argument
    end

    it 'should return broken bikes ' do
      bike1 = Bike.new
      bike2 = Bike.new.break!
      bikes = [bike1,bike2]
      subject.collect_broken_bikes(bikes)
      expect(subject.bikes).to eq [bike2]
    end

    it 'should be able to collect broken bikes from multiple racks' do
      broke1, work1 = [Bike.new.break!, Bike.new]
      work2, broke2 = [Bike.new, Bike.new.break!]

      subject.collect_broken_bikes([work1, broke2])
      subject.collect_broken_bikes([broke1, work2])

      expect(subject.bikes).to include broke1
      expect(subject.bikes).to include broke2
    end
  end

  context "when delivering bikes" do
    it 'should respond to deliver_broken_bikes method' do
      expect(subject).to respond_to :deliver_broken_bikes
    end

    it 'should respond to deliver_broken_bikes with 1 argument' do
      expect(subject).to respond_to(:deliver_broken_bikes).with(1).argument
    end

    it 'should be able to deliver bikes to a garage' do
      broken_bike = Bike.new.break!
      subject.instance_variable_set(:@bikes, [broken_bike])
      garage = double(:garage, :bikes => [])
      subject.deliver_broken_bikes(garage.bikes)
      expect(garage.bikes).to eq [broken_bike]
    end

    it 'should be able to deliver only broken bikes to garage' do
      working_bike, broken_bike = Bike.new, Bike.new.break!
      subject.instance_variable_set(:@bikes, [broken_bike, working_bike])
      garage = double(:garage, :bikes => [])
      subject.deliver_broken_bikes(garage.bikes)
      expect(garage.bikes).to eq [broken_bike]
    end

    it 'should respond to deliver_working_bikes' do
      expect(subject).to respond_to :deliver_working_bikes
    end

    it 'should respond to deliver working bikes with 1 argument' do
      expect(subject).to respond_to(:deliver_working_bikes).with(1).argument
    end

    it 'should be able to deliver working bikes to a docking station' do
      working_bike = Bike.new
      subject.instance_variable_set(:@bikes, [working_bike])
      docking_station = double(:docking_station, :bikes => [])
      subject.deliver_working_bikes(docking_station.bikes)
      expect(docking_station.bikes).to eq [working_bike]
    end

    it 'should have no bikes in the rack after delivery' do
      dock = double(:docking_station, bikes: [Bike.new.break!])
      subject.collect_broken_bikes(dock.bikes)
      expect(subject.bikes.size).to eq 1
      subject.instance_variable_set(:@bikes, [Bike.new])
      subject.deliver_working_bikes(dock.bikes)
      expect(subject.bikes).to eq []
    end

    it 'should only have the broken bikes after the delivery' do
      working_bike, broken_bike = Bike.new, Bike.new.break!
      subject.instance_variable_set(:@bikes, [working_bike, broken_bike])
      docking_station = double(:docking_station, :bikes => [])
      subject.deliver_working_bikes(docking_station.bikes)
      expect(subject.bikes).to eq [broken_bike]
    end

  end
end
