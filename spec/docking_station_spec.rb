require 'docking_station'

describe DockingStation do
  let(:bike) {Bike.new}

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

  it { is_expected.to respond_to(:dock).with(1).argument }

  it { is_expected.to respond_to(:bike)}

  it 'shows me which bike is docked' do
    subject.dock(bike)
    expect(subject.bike).to eq bike
  end

  it 'raises an error when #release_bike and the station is empty' do
    expect {subject.release_bike}.to raise_error("This docking station is empty")
  end

  it 'raises an error when docking a bike when docking station is full' do
    subject.dock(bike)
    expect {subject.dock(bike)}.to raise_error("This docking station is full")
  end
end
