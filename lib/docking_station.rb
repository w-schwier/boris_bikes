require_relative 'bike'
require_relative 'van'


class DockingStation
  public

  DEFAULT_CAPACITY = 20

  attr_reader :bikes, :capacity, :broken_bikes

  def initialize(capacity = DEFAULT_CAPACITY)
    @bikes = []
    @broken_bikes = []
    @capacity = capacity
  end

  def release_bike
    fail "No Bikes" if empty?
    @bikes.pop
  end

  def dock(bike)
    fail "Dock Full" if full?
    if bike.broken?
      @broken_bikes << bike
    else
      @bikes << bike
    end
  end

  private

  def empty?
    @bikes.empty?
  end

  def full?
    @bikes.count + @broken_bikes.count >= @capacity
  end
end
