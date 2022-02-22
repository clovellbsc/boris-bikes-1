require "DockingStation.rb"

describe DockingStation do
  it { expect(subject).to respond_to(:release_bike) }
end

describe DockingStation do
  it { expect(subject.release_bike).to be_a Bike }

  it { expect(subject.release_bike.working?).to eq true }
end

describe DockingStation do
  it { expect(subject).to respond_to(:docking_bike) }
end