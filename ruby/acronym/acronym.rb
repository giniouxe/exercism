# Generates some jargon by converting a long name to its acronym.
class Acronym
  def self.abbreviate(long)
    words = long.gsub(/[^a-zA-Z]/, ' ').split(' ')
    words.map do |w|
      w.capitalize! if w[0] == w[0].downcase || w[1] == w[1].upcase
    end
    letters = words.join.chars
    acronym = []
    letters.each { |l| acronym << l if l == l.upcase }
    acronym.join
  end
end
