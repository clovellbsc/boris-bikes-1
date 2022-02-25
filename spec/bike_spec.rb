require "Bike.rb"

describe Bike do
  it { expect(subject).to respond_to(:working?) }

  it 'should be able to report a broken bike' do
    bike = Bike.new
    bike.report_broken
    expect(bike).to_not be_working
  end
end

