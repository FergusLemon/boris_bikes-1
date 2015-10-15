require 'bike'

describe Bike do
  it 'is expected to be working' do
  expect(subject.working_status).to eq true
end

  it 'changes the working status of the specified instance of Bike when #report_broken is used' do
    bike = Bike.new
    bike.report_broken
    expect(bike.working_status).to eq false
  end
end
