# Given an age in seconds, calculates how old someone is in terms of a given
# planet's solar years.
class SpaceAge
  ORBITAL_PERIODS = {
    earth:   31_557_600,
    mercury: 7_600_543.819,
    venus:   19_414_149.052,
    mars:    59_354_032.690,
    jupiter: 374_355_659.124,
    saturn:  929_292_362.884,
    uranus:  2_651_370_019.329,
    neptune: 5_200_418_560.032
  }

  attr_reader :seconds

  def initialize(age)
    @seconds = age
  end

  ORBITAL_PERIODS.each do |planet, period_in_seconds|
    define_method("on_#{planet}".to_sym) { seconds.fdiv(period_in_seconds) }
  end
end
