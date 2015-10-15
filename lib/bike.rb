class Bike
attr_reader :working_status

  def initialize
    @working_status = true
  end

  def report_broken
    @working_status = false
  end
end
