class Matrix
  def initialize(data)
    @data = data.split("\n")
  end

  def rows
    @data.each_with_object([]) { |row, rows| rows << cells_for(row) }
  end

  def columns
    rows.each_with_object(Array.new(rows.length) { [] }) do |cells, columns|
      columns.each_with_index { |column, index| column << cells[index] }
    end
  end

  private

  def cells_for(row)
    row.split(' ').map(&:to_i)
  end
end
