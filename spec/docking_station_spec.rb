require 'docking_station'

describe DockingStation do
  let(:bike) {Bike.new}

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
    it 'releases a bike when #release_bike is called, so long as the bike is working' do
      subject.dock(bike)
      expect(subject.release_bike).to eq bike
    end

    it 'raises an error when user tries to release a broken bike' do
      broken_bike = bike
      broken_bike.report_broken
      subject.dock(broken_bike)
      expect {subject.release_bike}.to raise_error "This bike is broken"
    end
    it 'expects bike to be working' do
      subject.dock(bike)
      expect(subject.release_bike.working_status).to eq true
    end
  end

  it { is_expected.to respond_to(:dock).with(1).argument }

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
