# Computes the prime factors of a given natural number.
class PrimeFactors
  def self.for(number)
    divisor = 2
    [].tap do |factors|
      while number > 1
        if number % divisor == 0
          factors << divisor && number /= divisor
        else
          divisor += 1
        end
      end
    end
  end
end
