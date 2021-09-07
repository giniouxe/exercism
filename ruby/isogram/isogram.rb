=begin
Write your code for the 'Isogram' exercise in this file. Make the tests in
`isogram_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/isogram` directory.
=end

class Isogram
  def self.isogram?(input)
    letters = input.downcase.gsub('-', '').gsub(' ', '').split('')
    letters.length == 0 || letters.length == letters.uniq.length
  end
end
