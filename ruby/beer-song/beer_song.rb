require 'pry'

class BeerSong
  WALL = 'on the wall'

  def verse(num)
    verse = "#{bottles(num).capitalize} #{WALL}, #{bottles(num)}.\n"
    verse << "#{action(num)}"
    verse << punchline(num)
  end

  def verses(last, first)
    verses = ''
    last.downto(first) do |num|
      verses << verse(num)
      verses << "\n"
    end
    verses
  end

  def sing
    verses(99, 0)
  end

  def bottles(num)
    stock = num > 0 ? "#{num}" : 'no more'
    stock << "#{num == 1 ? ' bottle' : ' bottles'} of beer"
  end

  def action(num)
    if num == 0
      'Go to the store and buy some more,'
    else
      action = 'Take '
      action << "#{num > 1 ? 'one' : 'it'} down and pass it around,"
    end
  end

  def punchline(num)
    num == 0 ? " 99 bottles of beer #{WALL}.\n" : " #{bottles(num - 1)} #{WALL}.\n"
  end
end
