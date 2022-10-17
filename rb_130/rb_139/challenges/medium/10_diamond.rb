# class - Diamond

# class methods:
# - make diamond

# input - letter - uppercase - example -'C'

# output : 

#   A
#  B B
# C   C
#  B B
#   A

# helper methods as required

# class Diamond
#   ALPHABET = ('A'..'Z').to_a

#   def self.make_diamond(letter)
#     Diamond.new.make_diamond(letter)
#   end

#   def make_diamond(letter)
#     @letter = letter
#     @diamond_array = []
#     letter_difference = letter.ord - 'A'.ord
#     @max_width = (letter_difference * 2) + 1
#     create_upper_half
#     create_lower_half
#     @diamond_array.join("\n") + "\n"
#   end

#   private

#   def create_upper_half

#     ('A'..@letter).each_with_index do |current, index|
#       if index == 0
#         @diamond_array << current.center(@max_width)
#       else
#         spaces = (index * 2) - 1
#         @diamond_array << (current + " " * spaces + current).center(@max_width)
#       end
#     end
#   end

#   def create_lower_half
#     @diamond_array += @diamond_array[0..-2].reverse
#   end
# end

class Diamond
  def self.make_diamond(letter)
    range = ('A'..letter).to_a
    max_width = (range.size * 2) - 1
    rows = range.map.with_index do |current_letter, index|
      spaces = (index * 2) - 1
      make_row(current_letter, spaces).center(max_width)
    end
    mirror_rows(rows).join("\n") + "\n"

  end

  class << self
    private

    def make_row(letter, spaces)
      if spaces < 0
        letter
      else
        letter + ' '  * spaces + letter
      end
    end

    def mirror_rows(rows)
      rows += rows[0..-2].reverse
    end
  end
end
# puts Diamond.make_diamond('C')