require 'van'
describe Van do

  let(:bike) {double :bike}

  it { is_expected.to respond_to(:dock).with(1).argument }

  it { is_expected.to respond_to(:bikes) }

  it 'shows me that my bike is docked' do
    subject.dock([bike])
    expect(subject.bikes).to include(bike)
  end

  it 'raises an error docking a bike when van is full' do
    Van::DEFAULT_CAPACITY.times{subject.dock([bike])}
    expect {subject.dock([bike])}.to raise_error("This docking station is full")
  end

  it { is_expected.to respond_to(:release_broken_bikes) }

  it 'releases broken bikes from the bikes array' do
    bike1 = double(working_status: false)
    bike2 = double(working_status: false)
    bike3 = double(working_status: true)
    array = [bike1, bike2]   #  array2 = [bike1, bike2, bike3]
    subject.dock([bike1])
    subject.dock([bike2])
    subject.dock([bike3])
    expect(subject.release_broken_bikes).to eq array
  end
end
