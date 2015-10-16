require_relative 'bike'

class DockingStation
  attr_reader :bikes, :capacity

  DEFAULT_CAPACITY = 20

  def initialize(capacity=DEFAULT_CAPACITY)
    @bikes =[]
    @capacity = capacity
  end

  def dock(bike)
    raise 'This docking station is full' if full?
    bikes << bike
  end

  def release_bike
    raise 'This docking station is empty' if empty?
    raise 'This bike is broken' unless bikes.last.working_status
    bikes.pop
  end

  def release_broken_bikes
    get_broken
  end

  private
  def full?
    bikes.length >= capacity
  end

  def empty?
    bikes.empty?
  end

  def get_broken
    bikes.select { |bike| !bike.working_status }.each { |bike| bikes.delete(bike) }
  end

end
