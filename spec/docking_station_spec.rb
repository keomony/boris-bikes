require 'docking_station'
describe DockingStation do
 it { should respond_to :release_bike }

 it "should release a working bike" do
   bike = subject.release_bike
   expect(bike).to be_working
 end

 it { should respond_to(:dock).with(1).argument}

 it "returns docked bikes" do
   bike = Bike.new
   subject.dock(bike)
   expect(subject.bike).to eq bike
 end



end
