require "DockingStation.rb"
require "bike.rb"

describe DockingStation do
  it 'responds to release bike' do 
    expect(subject).to respond_to(:release_bike)
  end

  it 'releases working bikes' do
    subject.docking_bike(Bike.new)
    bike = subject.release_bike
    expect(bike).to be_working
  end

  it 'responds to docking bike' do
    expect(subject).to respond_to(:docking_bike)
  end

  it 'can be passed a new Bike object and be stored in the instance variable' do
    new_bike = Bike.new
    
    expect(subject.docking_bike(new_bike)).to eql([new_bike])
  end

  it 'raises an error when trying to release a bike from an empty dock' do
    expect {subject.release_bike}.to raise_error(NoBikeError)
  end

  it 'can store 20 bikes in the instance variable' do 
    subject.CAPACITY.times { subject.docking_bike(Bike.new) }
    expect(subject.stored_bikes.count).to eq subject.CAPACITY
  end

  it 'raises an error when the dock capacity is exceeded' do
    20.times {subject.docking_bike(Bike.new) }# needs to be 20 in dock so that the below will cause an error
    expect { subject.docking_bike(Bike.new) }.to raise_error(DockFullError) 
  end

  it 'ability to set a variable capacity that defaults to 20 with no input' do
    expect(subject().CAPACITY).to eq(20)
    dock = DockingStation.new(10)
    expect(dock.CAPACITY).to eq(10)
  end

  it 'should not release broken bikes' do
    bike = Bike.new
    bike.report_broken
    docking_station = DockingStation.new
    docking_station.docking_bike(bike)
    expect{docking_station.release_bike}.to raise_error 'Bike is broken'
  end
end
