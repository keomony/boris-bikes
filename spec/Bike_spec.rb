require "bike"
describe Bike do

  it { expect(subject).to respond_to :working? }
  it "should return true if the bike is working" do
    expect(subject.working?).to eq true
  end
  it "should respond to break!" do
    expect(subject).to respond_to :break!
  end
  it "should NOT be working when the bike is broken" do
    subject.break!
    expect(subject.working?).to eq false
  end
  it 'should return a bike when break! is called' do
    expect(subject.break!).to be_kind_of Bike
  end
end
