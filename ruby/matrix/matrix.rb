class Matrix
  def initialize(data)
    @data = data.each_line
  end

  def rows
    @data.map { |row| cells_for(row) }
  end

  def columns
    rows.transpose
  end

  private

  def cells_for(row)
    row.split.map(&:to_i)
  end
end
