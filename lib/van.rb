require_relative 'docking_station'

class Van

  DEFAULT_CAPACITY = 10

  attr_reader :bikes_in_van, :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @bikes_in_van = []
    @capacity = capacity
  end

  def collect(station)
    fail "No Bikes to take" if station.broken_bikes.empty?
    fail "Van Full" if full?
    @bikes_in_van << station.broken_bikes
  end

  def drop_off(garage)

  end

  def pick_up(garage)

  end

  def deliver(station)

  end

  private

  def empty?
    @bikes_in_van.empty?
  end

  def full?
    @bikes_in_van.count >= @capacity
  end

end
