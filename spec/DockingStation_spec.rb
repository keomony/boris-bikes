require "docking_station"
#require "bike"

describe DockingStation do
  let(:broken_bike){ double("Bike") }
  let (:bike) { double(:bike)}
  # can we release a bike
  it { is_expected.to respond_to :release_bike }

  # can we dock a bike
  it { is_expected.to respond_to(:dock).with(1).argument }

  # does station respond to method bike
  it { is_expected.to respond_to(:bikes) }

  # new test: check that the bike docked is the one we are viewing
  describe '#dock' do

    it 'docks a bike' do
      expect(subject.dock(bike)).to eq bike
    end

    it 'views docked bikes' do
      expect(subject.dock(bike)).to eq bike
    end

    it 'accepts only 20 bikes in a dock' do
      expect {((DockingStation::DEFAULT_CAPACITY)+1).times {subject.dock(Bike.new)} }.to raise_error "Dock is full"
    end

    it 'should accept the broken bike' do
      subject.dock(broken_bike)
      expect(subject.bikes).to eq [ broken_bike ]
    end
  end

  describe '#release_bike' do
    it 'releases working bikes' do
      allow(bike).to receive(:working?).and_return(true)
      subject.dock(bike)
      release_bike = subject.release_bike
      expect(release_bike).to be_working

    end
    it 'raises an error when there are no bikes available' do
      expect { subject.release_bike }.to raise_error "There are no bikes available"
    end
    it 'should NOT release a bike if it\'s broken' do
      subject.dock(broken_bike)
      allow(broken_bike).to receive(:working?).and_return(false)
      expect(subject.release_bike).to eq nil
    end
  end

end
