class Nucleotide
  VALID_NUCLEOTIDES = %w[G T C A].freeze

  class << self
    def from_dna(dna)
      @nucleotides = dna.split('')
      raise ArgumentError unless valid?

      self
    end

    def count(nucleotide)
      @nucleotides.count(nucleotide)
    end

    def histogram
      base = { 'A' => 0, 'T' => 0, 'C' => 0, 'G' => 0 }
      @nucleotides.each_with_object(base) do |nucleotide, histogram|
        histogram[nucleotide] += 1
      end
    end

    private

    def valid?
      (@nucleotides - VALID_NUCLEOTIDES).empty?
    end
  end
end
