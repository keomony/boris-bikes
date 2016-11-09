require 'docking_station'
describe DockingStation do
 it { should respond_to :release_bike }

 it { should respond_to(:dock).with(1).argument}

 it "returns docked bike" do
   bike = Bike.new
   subject.dock(bike)
   expect(subject.bike).to eq bike
 end
  
 describe '#release_bike' do
  it "raises an error when there's no bike available" do
   expect { subject.release_bike }.to raise_error 'No bikes available' 
  end
 end


end
