require_relative 'bike'
class Van
  DEFAULT_CAPACITY = 20
  attr_reader :bikes, :capacity


  def initialize(capacity=DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end

  def dock(bike)
    bike.each { |i|
      raise 'This docking station is full' if full?
      bikes << i }
  end

  def release_broken_bikes
    get_broken
  end

  private

  def get_broken
    bikes.select { |bike| !bike.working_status }.each { |bike| bikes.delete(bike) }
  end

  def full?
    bikes.length >= capacity
  end

end
