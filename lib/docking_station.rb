require_relative 'bike'

class DockingStation
  attr_reader :bikes, :capacity

  DEFAULT_CAPACITY = 20

  def initialize(capacity=DEFAULT_CAPACITY)
    @bikes =[]
    @capacity = capacity
  end

  def release_bike
    raise 'This docking station is empty' if empty?
    @bikes.pop
  end

  def dock(bike, working_order=true)
    raise 'This docking station is full' if full?
    bike.working_order = working_order
    @bikes << bike
  end

  private
  def full?
    @bikes.length >= @capacity
  end

  def empty?
    @bikes.empty?
  end

end
