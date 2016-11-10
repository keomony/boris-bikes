require "docking_station"
#require "bike"

describe DockingStation do

  # can we release a bike
  it { is_expected.to respond_to :release_bike }

  # it 'releases working bikes' do
  #   bike = subject.release_bike
  #   expect(bike).to be_working
  # end

  # can we dock a bike
  it { is_expected.to respond_to(:dock).with(1).argument }

  # does station respond to method bike
  it { is_expected.to respond_to(:bike) }

  # new test: check that the bike docked is the one we are viewing
  describe '#dock' do
    bike = Bike.new

    it 'docks a bike' do
      expect(subject.dock(bike)).to eq bike
    end

    it 'views docked bikes' do
      expect(subject.dock(bike)).to eq bike
    end

    it 'accepts only one bike in a dock' do
      expect {((DockingStation::DEFAULT_CAPACITY)+1).times {subject.dock(Bike.new)} }.to raise_error "Dock is full"
    end
  end

  describe '#release_bike' do
    it 'raises an error when there are no bikes available' do
      expect { subject.release_bike }.to raise_error "There are no bikes available"
    end
  end

end
