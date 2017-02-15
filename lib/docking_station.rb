class DockingStation

  DEFAULT_CAPACITY = 20

  attr_reader :bikes, :capacity

  def initialize(capacity=DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end

  def release_bike
    fail "No bikes available" if empty?
    bikes.pop
    # ||= Bike.new
  end

  def dock(bike)
    fail "Full capacity!" if full?
    bikes << bike
  end

  private

  def full?
    bikes.length >= DEFAULT_CAPACITY
    # @capacity == DEFAULT_CAPACITY ? true : false
  end

  def empty?
    bikes.empty?
  end
end
