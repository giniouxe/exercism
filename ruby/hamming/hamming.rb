# Calculate Hamming distance
class Hamming

  # Counts hamming distance between to DNA strings
  def self.compute(origin, mutation)

    pairs = origin.split('').zip(mutation.split(''))
    count = 0

    pairs.each { |i| count += 1 if i[0] != i[1] }
    count
  end

end
