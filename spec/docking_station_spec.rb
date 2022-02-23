require "DockingStation.rb"

describe DockingStation do
  it { expect(subject).to respond_to(:release_bike) }
end

describe DockingStation do
  it { 
    subject.docking_bike(Bike.new)
    expect(subject.release_bike).to be_a Bike 
  }

  it { 
    subject.docking_bike(Bike.new)
    expect(subject.release_bike.working?).to eq true 
  }
end

describe DockingStation do
  it { expect(subject).to respond_to(:docking_bike) }
end

describe DockingStation do
  new_bike = Bike.new
  it 'does something' do 
    subject.docking_bike(new_bike)
    expect(subject.instance_variable_get(:@stored_bikes)).to eql([new_bike])
  end
end

describe DockingStation do
  it { expect {subject.release_bike}.to raise_error(NoBikeError) }
end

describe DockingStation do
  it { 
    20.times { subject.docking_bike(Bike.new) }
    expect(subject.stored_bikes.count).to eq 20
   }
end

describe DockingStation do
  it { 
    20.times {subject.docking_bike(Bike.new) }# needs to be 20 in dock so that the below will cause an error
    expect { subject.docking_bike(Bike.new) }.to raise_error(DockFullError) 
  }
end
