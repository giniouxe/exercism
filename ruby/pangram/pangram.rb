require 'active_support/inflector'

# Used to determine if a sentence is a pangram
class Pangram
  ALPHABET = ('a'..'z').to_a

  attr_reader :sentence

  def initialize(sentence)
    @sentence = sentence
  end

  def self.is_pangram?(sentence)
    new(sentence).include_all_alphabet?
  end

  def include_all_alphabet?
    ALPHABET.all? do |letter|
      sanitized_letters.include?(letter)
    end
  end

  def sanitized_letters
    string = ActiveSupport::Inflector.transliterate(sentence)
    string.downcase.gsub(/[^\p{L}]/, '').chars
  end
end

# Problems' version tracking
module BookKeeping
  VERSION = 2
end
