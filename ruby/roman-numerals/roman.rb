class Integer

  ARABIC = 0
  ROMAN = 1

  def to_roman
    number = self
    romans = [[1000, 'M'],
              [900, 'CM'],
              [500, 'D'],
              [400, 'CD'],
              [100, 'C'],
              [90, 'XC'],
              [50, 'L'],
              [40, 'XL'],
              [10, 'X'],
              [9, 'IX'],
              [5, 'V'],
              [4, 'IV'],
              [1, 'I']]

    result = ''

    romans.each do |pair|
      if number >= pair[ARABIC]
        result << pair[ROMAN] * number.div(pair[ARABIC])
        number = number % pair[ARABIC]
      end
    end

    result

  end

end
