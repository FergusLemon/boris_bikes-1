require_relative 'bike'

class DockingStation
  attr_reader :bikes

  def initialize
    @bikes =[]
  end

  def release_bike
    raise 'This docking station is empty' if @bikes.empty?
    @bikes.pop
  end

  def dock(bike)
    raise 'This docking station is full' if @bikes.length >= 20
    @bikes << bike
  end
end
