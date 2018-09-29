# Scrabble scoring
class Scrabble
  POINTS = {
    'AEIOULNRST' => 1,
    'DG' => 2,
    'BCMP' => 3,
    'FHVWY' => 4,
    'K' => 5,
    'JX' => 8,
    'QZ' => 10
  }.freeze

  def initialize(word)
    @word = upcased(word)
  end

  def self.score(word)
    new(word).score
  end

  def score
    POINTS.sum { |(letters, points)| sum_points_for(letters, points) }
  end

  private

  def upcased(word)
    word.to_s.upcase
  end

  def sum_points_for(letters, points)
    letters.chars.sum { |letter| @word.count(letter) * points }
  end
end
