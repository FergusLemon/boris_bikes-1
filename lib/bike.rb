class Bike
  attr_accessor :working_order

  def initialize(working_order=true)
    @working_order = working_order
  end
  def working?
    @working_order
  end
end
