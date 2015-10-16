require 'docking_station'

describe DockingStation do
  let(:bike) {double :bike} #this creates a SINGLE double variable, that is invoked when we type 'bike' - it has the same object ID each time. (We think)

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
# we are using the following instructions to create the doubles with their method stubs: https://github.com/rspec/rspec-mocks#method-stubs
  describe '#release_bike' do
    it 'releases a bike when #release_bike is called, so long as the bike is working' do
      working_bike = double(:working_status => true)
      subject.dock (working_bike)
      expect(subject.release_bike).to eq (working_bike)
    end

    it 'raises an error when user tries to release a broken bike' do
      subject.dock(double(:working_status => false))
      expect {subject.release_bike}.to raise_error "This bike is broken"
    end

    it 'expects bike to be working' do
      subject.dock (double(:working_status => true))
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

  it 'releases broken bikes from the bikes array' do
    bike1 = double(working_status: false)
    bike2 = double(working_status: false)
    bike3 = double(working_status: true)
    array = [bike1, bike2]
    array2 = [bike1, bike2, bike3]
    subject.dock(bike1)
    subject.dock(bike2)
    subject.dock(bike3)
    expect(subject.release_broken_bikes).to eq array
  end

end
