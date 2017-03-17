require 'docking_station'

describe DockingStation do
  let(:bike) { double :bike }

  describe 'initialization' do
    subject {DockingStation.new}
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
      bike = double(:bike, broken?: false)
      subject.dock(bike)
      expect(subject.release_bike).to eq(bike)
    end

    it "doesn't release a broken bike" do
      bike = double(:bike, broken?: true)
      subject.dock(bike)
      expect{subject.release_bike}.to raise_error("Bike is broken")
    end
  end

  describe "#dock" do

    it "checks dock method" do
      expect(subject).to respond_to(:dock).with(1).argument
    end

    it "checks bike has been added to existing bikes" do
      bike = double(:bike)
      expect(subject.dock(bike)).to eq (subject.bikes << bike)
    end

    it "Cannot dock if the station is full" do
      subject.capacity.times {subject.dock(double(:bike))}
      expect {subject.dock(double(:bike))}.to raise_error("Dock Full")
    end

    it "Docks a broken bike" do
      bike = double(:bike, report_broken: true)
      bike.report_broken
      expect(subject.dock(bike)).to eq (subject.bikes << bike)
    end

  end

  it "Checks default maximum capacity" do
    expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
  end


end
