class Anagram
  attr_reader :word

  def initialize(word)
    @word = word.downcase
  end

  def match(list)
    list.select do |anagram|
      same_letters?(anagram) && different_word?(anagram)
    end
  end

  def same_letters?(anagram)
    anagram.downcase.chars.sort == word.chars.sort
  end

  def different_word?(anagram)
    anagram.downcase != word
  end
end
