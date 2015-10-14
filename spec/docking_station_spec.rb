require 'docking_station'

describe DockingStation do
  let(:bike) {Bike.new}

  # describe 'initialization' do
  #   subject { DockingStation.new }
  # end
  # it { is_expected.to respond_to(:initialize).with(1).argument}

  # it 'allows user to ' do
  #   capacity = 25
  #   station = DockingStation.new(capacity)
  #   expect(subject.capacity).to eq capacity
  # end

  it 'has a default capacity' do
    expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
  end

  it 'has a variable capacity' do
    variable_capacity = 23
    station = DockingStation.new(variable_capacity)
    variable_capacity.times { station.dock(bike)}
    expect {station.dock(bike)}.to raise_error "This docking station is full"
  end

  it { is_expected.to respond_to(:release_bike)}

  describe '#release_bike' do
    it 'releases a bike when #release_bike is called' do
      subject.dock(bike)
      expect(subject.release_bike).to eq bike
    end
    it 'expects bike to be #working' do
      subject.dock(bike)
      expect(subject.release_bike).to be_working
    end
  end

  it { is_expected.to respond_to(:dock).with(2).argument }

  it 'registers a bike as broken when returned' do
    subject.dock(bike, false)
    expect(bike).to_not be_working
  end

  it { is_expected.to respond_to(:bikes)}

  it 'shows me that my bike is docked' do
    subject.dock(bike)
    expect(subject.bikes).to include(bike)
  end

  it 'raises an error when #release_bike and the station is empty' do
    expect {subject.release_bike}.to raise_error("This docking station is empty")
  end

  it 'raises an error when docking a bike when docking station is full' do
    DockingStation::DEFAULT_CAPACITY.times{subject.dock(bike)}
    expect {subject.dock(bike)}.to raise_error("This docking station is full")
  end
end
