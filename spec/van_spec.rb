require 'van'
describe Van do

  let(:bike) {double :bike}

  it { is_expected.to respond_to(:dock).with(1).argument }

  it { is_expected.to respond_to(:bikes) }

  it 'shows me that my bike is docked' do
    subject.dock(bike)
    expect(subject.bikes).to include(bike)
  end

  it { is_expected.to respond_to(:release_bike) }

  it 'releases a bike from the end of the array' do
    subject.dock(bike)
    expect(subject.release_bike).to eq bike
  end
end
