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
    subject.docking_bike(new_bike)
    expect(subject.instance_variable_get(:@stored_bikes)).to eql([new_bike])
  end

  it 'raises an error when trying to release a bike from an empty dock' do
    expect {subject.release_bike}.to raise_error(NoBikeError)
  end

  it 'can store 20 bikes in the instance variable' do 
    20.times { subject.docking_bike(Bike.new) }
    expect(subject.stored_bikes.count).to eq 20
  end

  it 'raises an error when the dock capacity is exceeded' do
    20.times {subject.docking_bike(Bike.new) }# needs to be 20 in dock so that the below will cause an error
    expect { subject.docking_bike(Bike.new) }.to raise_error(DockFullError) 
  end
end
