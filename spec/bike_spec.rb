require 'bike'

describe Bike do
  it {is_expected.to respond_to :working?}

  it "allows a bike to be broken" do
    bike = Bike.new
    subject.report_broken
    expect(subject).to be_broken
  end
end
