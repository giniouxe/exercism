require 'active_support/inflector'

module BookKeeping
  VERSION = 2
end

class Pangram

  ALPHABET = %w[a b c d e f g h i j k l m n o p q r s t u v w x y z]

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
