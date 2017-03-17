require 'docking_station'

describe DockingStation do

  describe 'initialization' do
    subject {DockingStation.new}
    let(:bike) {Bike.new}
    it 'defaults capacity' do
      described_class::DEFAULT_CAPACITY.times do
        subject.dock(bike)
      end
      expect{subject.dock(bike)}.to raise_error "Dock Full"
    end
  end

  describe "#release_bike" do

    it "no bike released if no bikes" do
      expect { subject.release_bike }.to raise_error("No Bikes")
    end

    it "releases a bike" do
      bike = Bike.new
      subject.dock(bike)
      expect(subject.release_bike).to eq(bike)
    end
  end

  describe "#dock" do

    it "checks dock method" do
      expect(subject).to respond_to(:dock).with(1).argument
    end

    it "checks bike has been added to existing bikes" do
      bike = Bike.new
      expect(subject.dock(bike)).to eq (subject.bikes << bike)
    end

    it "Cannot dock if the station is full" do
      subject.capacity.times {subject.dock(Bike.new)}
      expect {subject.dock(Bike.new)}.to raise_error("Dock Full")

    end

  end

  it "Checks default maximum capacity" do
    expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
  end


end
