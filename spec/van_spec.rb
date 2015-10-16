require 'van'
describe Van do

  it { is_expected.to respond_to(:dock_bike).with(1).argument }

end
