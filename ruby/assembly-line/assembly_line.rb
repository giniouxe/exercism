class AssemblyLine

  class InvalidSpeedError < StandardError
    def message
      "Speed must be betwen 1 and 10 and be an Integer"
    end
  end

  CARS_PRODUCED_PER_SPEED = 221
  SUCCES_RATES = {
    1 => 1,
    2 => 1,
    3 => 1,
    4 => 1,
    5 => 0.9,
    6 => 0.9,
    7 => 0.9,
    8 => 0.9,
    9 => 0.8,
    10 => 0.77
  }.freeze


  def initialize(speed)
    @speed = speed
    raise InvalidSpeedError unless valid_speed?
  end

  def production_rate_per_hour
    @speed * CARS_PRODUCED_PER_SPEED * SUCCES_RATES[@speed]
  end

  def working_items_per_minute
    (production_rate_per_hour / 60).floor
  end

  private

  def valid_speed?
    @speed > 0 && @speed <= 10 && @speed.is_a?(Integer)
  end
end
