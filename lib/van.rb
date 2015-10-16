require_relative 'bike'
class Van
  attr_reader :bikes


  def initialize
    @bikes = []
  end

  def dock(bike)
    bikes << bike
  end

  def release_broken_bikes
    get_broken
  end

  private

  def get_broken
    bikes.select { |bike| !bike.working_status }.each { |bike| bikes.delete(bike) }
  end

end
