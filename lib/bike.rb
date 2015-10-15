class Bike

  def initialize
    @working_status = true
  end

  def working?
    @working_status
  end

  def report_broken
    @working_status = false
  end
end
