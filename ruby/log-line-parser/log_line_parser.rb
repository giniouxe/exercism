class LogLineParser
  def initialize(line)
    @line = line
  end

  def message
    message = @line.gsub('[ERROR]: ', '') if error?
    message = @line.gsub('[WARNING]: ', '') if warning?
    message = @line.gsub('[INFO]: ', '') if info?
    message.strip
  end

  def log_level
    return 'error' if error?
    return 'warning' if warning?
    'info'
  end

  def reformat
    "#{message} (#{log_level})"
  end

  private

  def error?
    @line.start_with?('[ERROR]')
  end

  def warning?
    @line.start_with?('[WARNING]')
  end

  def info?
    @line.start_with?('[INFO]')
  end
end
