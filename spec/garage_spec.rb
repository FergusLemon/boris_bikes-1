require 'garage'

describe Garage do

  let(:bike) {double :bike}

  it { is_expected.to respond_to(:dock).with(1).argument }

  it { is_expected.to respond_to(:bikes) }

  it 'shows me that my bike is docked' do
    subject.dock([bike])
    expect(subject.bikes).to include(bike)
  end

  it 'raises an error docking a bike when van is full' do
    Garage::DEFAULT_CAPACITY.times{subject.dock([bike])}
    expect {subject.dock([bike])}.to raise_error("This Garage is full")
  end

  it { is_expected.to respond_to(:release_working_bikes) }

  it 'releases working bikes from the bikes array' do
    bike1 = double(working_status: false)
    bike2 = double(working_status: true)
    bike3 = double(working_status: true)
    array = [bike2, bike3]   #  array2 = [bike1, bike2, bike3]
    subject.dock([bike1])
    subject.dock([bike2])
    subject.dock([bike3])
    expect(subject.release_working_bikes).to eq array
  end

  it { is_expected.to respond_to(:fix_all) }

  it "checks if bikes are fixed" do
  bike1 = double(working_status: false)
  array = [bike1]
  subject.dock(array)
  expect(subject.fix_all).to eq array
  end
end
