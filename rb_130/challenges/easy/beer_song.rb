# class: BeerSong

# class methods:
# - verse - 1 argument - integer
# returns the the verse starting with the argument

class Verse
  attr_reader :bottles

  def initialize(bottles)
    @bottles = bottles
  end

  def single_verse
    case bottles
    when 0
      zero_bottle_verse
    when 1
      single_bottle_verse
    when 2
      two_bottle_verse
    else
      default_verse
    end
  end

  private

  def default_verse
    "#{bottles} bottles of beer on the wall, #{bottles} bottles of beer.\n" +
    "Take one down and pass it around, #{bottles - 1} bottles of beer on the wall.\n"
  end

  def zero_bottle_verse
    "No more bottles of beer on the wall, no more bottles of beer.\n" +
    "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
  end

  def single_bottle_verse
    "1 bottle of beer on the wall, 1 bottle of beer.\n" +
    "Take it down and pass it around, no more bottles of beer on the wall.\n"
  end

  def two_bottle_verse
    "2 bottles of beer on the wall, 2 bottles of beer.\n" +
    "Take one down and pass it around, 1 bottle of beer on the wall.\n"
  end
end


class BeerSong
  def self.verse(number)
    Verse.new(number).single_verse
  end

  def self.verses(first, last)
    result = []
    first.downto(last) do |n|
      result << verse(n)
    end
    result.join("\n")
  end

  def self.lyrics
    verses(99, 0)
  end
end
