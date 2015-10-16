class Van
  attr_reader :bikes

  def initialize
    @bikes = []
  end

  def dock(bike)
    bikes << bike
  end

  def release_bike
    bikes.pop
  end

end
