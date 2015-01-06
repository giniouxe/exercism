class Prime

  def self.nth(position)
    @primes = self.first(10)
    @primes[position - 1]
  end
end
