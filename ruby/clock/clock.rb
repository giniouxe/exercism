# A clock that handles times without dates.
# Allows to add and subtract minutes to it.
# Two clocks that represent the same time are equal to each other.
class Clock
  attr_reader :hour, :minute

  def initialize(hour: 0, minute: 0)
    @hour = hour
    @minute = minute
  end

  def to_s
    convert_minutes_to_hours
    convert_hours_to_24_format

    formatted_hour + ':' + formatted_minute
  end

  def +(other)
    @hour += other.hour
    @minute += other.minute
    to_s
  end

  def -(other)
    @hour -= other.hour
    @minute -= other.minute
    to_s
  end

  def ==(other)
    to_s == other.to_s
  end

  private

  def formatted_hour
    @hour < 10 ? "0#{@hour}" : @hour.to_s
  end

  def formatted_minute
    @minute < 10 ? "0#{@minute}" : @minute.to_s
  end

  def convert_minutes_to_hours
    while @minute < 0
      @hour -= 1
      @minute += 60
    end

    while @minute >= 60
      @hour += 1
      @minute -= 60
    end
  end

  def convert_hours_to_24_format
    @hour += 24 while @hour < 0
    @hour -= 24 while @hour >= 24
  end
end
