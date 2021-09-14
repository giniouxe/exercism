=begin
Write your code for the 'ISBN Verifier' exercise in this file. Make the tests in
`isbn_verifier_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/isbn-verifier` directory.
=end
class IsbnVerifier
  VALID_LENGTH = 10

  class << self

    def valid?(number)
      isbn = number.gsub('-', '').downcase

      return false unless valid_length?(isbn)

      numbers = format_isbn(isbn)
      validate_isbn_formula(numbers)
    end

    private

    def valid_length?(isbn)
      isbn.length == VALID_LENGTH
    end

    def format_isbn(isbn)
      numbers = isbn.split('')

      numbers[VALID_LENGTH - 1] = '10' if numbers.last == 'x'

      numbers
    end

    def validate_isbn_formula(numbers)
      return false if numbers.any?(/\D/)

      numbers.map(&:to_i).map.with_index { |n, i| n * (VALID_LENGTH - i) }.sum.modulo(11) == 0
    end
  end
end
