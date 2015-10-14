require 'docking_station'

describe DockingStation do
  it { is_expected.to respond_to(:release_bike)}

describe '#release_bike' do
  it 'returns a new bike when #release_bike is called' do
    expect(subject.release_bike).to be_instance_of Bike
  end
  it 'expects bike to be #working' do
    expect(subject.release_bike).to be_working
  end
end

end
