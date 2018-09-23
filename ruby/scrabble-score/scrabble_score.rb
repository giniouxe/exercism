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
    @word = word
  end

  def self.score(word)
    new(word).score
  end

  def score
    letters.inject(0) do |score, letter|
      POINTS.each { |key, value| score += value if key.include?(letter) }
      score
    end
  end

  private

  def letters
    @word.to_s.gsub(/\W/, '').upcase.split('')
  end
end
