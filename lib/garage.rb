
class Garage
  DEFAULT_CAPACITY = 20
  attr_reader :bikes, :capacity


  def initialize(capacity=DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end

  def dock(bike)
    bike.each { |i|
      raise 'This Garage is full' if full?
      bikes << i }
  end

  def release_working_bikes
    get_working
  end

  def fix_all
    @bikes.each {|bike| bike.repair if !bike.working_status }
  end

  private

  def get_working
    bikes.select { |bike| bike.working_status }.each { |bike| bikes.delete(bike) }
  end

  def full?
    bikes.length >= capacity
  end

  def repair(bike)
    bike.working_status = true
  end

end
