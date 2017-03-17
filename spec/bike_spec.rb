require 'bike'

describe Bike do

  it "allows a bike to be broken" do
    bike = Bike.new
    subject.report_broken
    expect(subject).to be_broken
  end
end
