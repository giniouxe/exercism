require 'active_support/inflector'

# Problems' version tracking
module BookKeeping
  VERSION = 2
end

# Used to determine if a sentence is a pangram
class Pangram
  ALPHABET = ('a'..'z').to_a

  attr_reader :sentence

  def initialize(sentence)
    @sentence = sentence
  end

  def self.is_pangram?(sentence)
    new(sentence).unique_letters == ALPHABET
  end

  def unique_letters
    sanitized_sentence.split('').sort.uniq
  end

  def sanitized_sentence
    string = ActiveSupport::Inflector.transliterate(sentence)
    string.downcase.gsub(/\d/, '').tr(' _."', '')
  end
end
