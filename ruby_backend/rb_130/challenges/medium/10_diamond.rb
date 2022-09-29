# create diamond with letters with the input letter at the widest point

# input C

#   A
#  B B
# C   C
#  B B
#   A

# width of widest row - difference between the letters * 2 + 1 

# class: Diamond

# constructor: 1 argument - uppercase letter

# method: make_diamond
# - max_width = as above
# - current_gap = 0
# - start loop from 'A' to input letter
#   - if letter is 'A' centered to the max_width
#   - else current letter seprated by `current_gap` centered to max_width
#   - add strings to an array
# - end loop

# - mirror the array apart from the middle line
class Diamond
  def self.make_diamond(letter)
    letters = ('A'..letter).to_a
    max_width = (letters.size - 1) * 2 + 1
    @@current_gap = 1
    letters.map! do |letter|
      make_row(letter).center(max_width)
    end
    mirror_letters(letters).join("\n") + "\n"
  end

  class << self
    private

    def make_row(letter)
      if letter == 'A'
        'A'
      else
        row = letter + ' ' * @@current_gap + letter
        @@current_gap += 2
        row
      end
    end

    def mirror_letters(letters)
      mirror = letters[0...-1].reverse
      letters << mirror unless mirror.empty?
      letters
    end
  end
end


# class Diamond
#   attr_reader :letter

#   def initialize(letter)
#     @letter = letter.upcase
#     @diamond = []
#     @max_width = (letter.ord - 'A'.ord) * 2 + 1
#   end

#   def make_diamond
#     make_first_half
#     make_second_half
#     @diamond.join("\n").concat("\n")
#   end

#   def self.make_diamond(letter)
#     Diamond.new(letter).make_diamond
#   end

#   private

#   def make_first_half
#     current_gap = 1
#     ('A'..letter).map do |current_letter|
#       if current_letter == 'A'
#         string = "#{current_letter}".center(@max_width)
#         @diamond << string
#       else
#         string = ("#{current_letter}" + " " * current_gap + "#{current_letter}").center(@max_width)
#         @diamond << string
#         current_gap += 2
#       end
#     end
#   end

#   def make_second_half
#     mirror = @diamond[0...-1].reverse
#     @diamond.push(mirror) unless mirror.empty?
#   end

# end
