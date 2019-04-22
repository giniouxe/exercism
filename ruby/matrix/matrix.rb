class Matrix
  def initialize(data)
    @data = data.each_line
  end

  def rows
    @data.each_with_object([]) { |row, rows| rows << cells_for(row) }
  end

  def columns
    rows.transpose
  end

  private

  def cells_for(row)
    row.split.map(&:to_i)
  end
end
