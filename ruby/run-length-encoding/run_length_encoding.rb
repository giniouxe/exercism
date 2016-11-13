require 'pry'

# Run-length encoding and decoding
class RunLengthEncoding
  class << self
    def encode(input)
      suites = input.chars.slice_when do |previous_letter, letter|
        previous_letter != letter
      end

      suites.each_with_object('') do |suite, output|
        output << format_encoding(suite)
      end
    end

    def decode(input)
      pairs = map_encoded(input)

      pairs.each_with_object('') do |pair, output|
        output << pair.last * pair.first
      end
    end

    private

    def format_encoding(suite)
      return suite.first if suite.size == 1
      suite.size.to_s + suite.first
    end

    def map_encoded(input)
      sequences = split_with_numbers(input)

      sequences.map! { |seq| seq.split(' ') }
      sequences.map! do |pair|
        if pair.length == 1
          [1, pair.last]
        else
          [pair.first.to_i, pair.last]
        end
      end
    end

    def split_with_numbers(input)
      sequence = ''
      input.chars.each_with_object([]) do |char, sequences|
        if char.to_i != 0
          sequence += char
        else
          sequence << ' ' << char
          sequences << sequence
          sequence = ''
        end
      end
    end
  end
end

module BookKeeping
  VERSION = 2
end
