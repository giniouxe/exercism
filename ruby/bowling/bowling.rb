require 'pry'

class Game
  def initialize
    @rolls = []
  end

  def roll(pins)
    @rolls << pins
  end

  def score
    score = 0
    frames.each_with_index do |frame, index|
      score += points_for(frame)
      score += points_for(frames[index + 1]) if spare?(frame)
    end
    score
  end

  def frames
    frames = []
    @rolls.each_with_index do |roll, index|
      next if index.odd?
      frames << [roll, @rolls[index + 1]]
    end
    frames
  end

  def points_for(frame)
    frame.first + frame.last
  end

  def spare?(frame)
    frame.first + frame.last == 10
  end

end

module BookKeeping
  VERSION = 2
end
