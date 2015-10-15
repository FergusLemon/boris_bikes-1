require 'bike'

describe Bike do
  it { is_expected.to be_working }

  it 'changes the working status of the specified instance of Bike' do
    bike = Bike.new
    bike.report_broken
    expect(bike.working?).to eq false
  end
end
