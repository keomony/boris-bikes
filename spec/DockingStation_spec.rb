require "docking_station"
require "bike"

describe DockingStation do
# can we release a bike
it { is_expected.to respond_to :release_bike }

it 'releases working bikes' do
  bike = subject.release_bike
  expect(bike).to be_working
end

# can we dock a bike
it { is_expected.to respond_to(:dock).with(1).argument }

# does station respond to method bike
it { is_expected.to respond_to(:bike) }

# new test: check that the bike docked is the one we are viewing
it 'docks a bike' do
  bike = Bike.new
  expect(subject.dock(bike)).to eq bike
  end

  it 'views docked bikes' do
    bike = Bike.new
    subject.dock(bike)
    expect(subject.bike).to eq bike
    end
end
