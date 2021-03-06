class Complement
  def self.of_dna(strand)
    fail ArgumentError, "#{strand} is not a DNA strand" if strand.include?('U')
    strand.tr('CGTA', 'GCAU')
  end

  def self.of_rna(strand)
    fail ArgumentError, "#{strand} is not a RNA strand" if strand.include?('T')
    strand.tr('GCAU', 'CGTA')
  end
end
