class Matrix
  def initialize(data)
    @data = data
  end

  def rows
    @data.each_line.map { |row| cells_for(row) }
  end

  def columns
    rows.transpose
  end

  private

  def cells_for(row)
    row.split.map(&:to_i)
  end
end
