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

  it { is_expected.to respond_to(:dock).with(1).argument }

  it { is_expected.to respond_to(:bike)}

  it 'shows me which bike is docked' do
    bike = Bike.new
    subject.dock(bike)
    expect(subject.bike).to eq bike
  end

end
