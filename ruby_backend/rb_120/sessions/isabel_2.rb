
# ############ Nimish 1. 2:33


# # Problem received from Raul Romero
# class Human 
#   attr_reader :name

#   def initialize(name="Dylan")
#     @name = name
#   end

#   def hair_colour(hair_colour)
#     @hair_colour = hair_colour
#     self
#   end

#   def self.hair_colour(hair_colour)
#     if hair_colour.empty?
#       "Hi, my name is Dylan and I have blonde hair."
#     else
#       "Hi, my name is Dylan and I have #{hair_colour} hair."
#     end
#   end

#   def to_s
#     "Hi, my name is #{name} and I have #{@hair_colour} hair."
#   end

# end

# # puts Human.new("Jo").hair_colour("blonde")
# # Should output "Hi, my name is Jo and I have blonde hair."

# puts Human.hair_colour("")              
# puts Human.hair_colour("red")
# # Should "Hi, my name is Dylan and I have blonde hair."


# ### watch out for typos


# ############## - Isabel 2. 8:05

# class Person
#   def initialize(name)
#     @name = name
#   end

#   def name=(name)
#     @name = name.upcase!
#   end
# end

# tom = Person.new("Tom")
# p tom.name = "Tim"

# # Come up with 3 real world examples for the use of public, private and protected.

# 1

class CreditCard
  def initialize(name, number=nil)
    @name = name
    if number
      @numbers = [number]
    else
      @numbers = []
    end
  end

  def print_card_details
    puts "Name: #{name}"
    puts "Card Numbers:"
    puts masked_card_numbers
  end

  def merge_card_account(card)
    temp_card = CreditCard.new(name)
    merged_numbers = numbers | card.numbers 
    temp_card.numbers = merged_numbers
    temp_card
  end

  private

  def masked_card_numbers
    card_nos = []
    @numbers.each do |number|
      card_nos << 'xxxx' + number.to_s[-4..-1]
    end
    card_nos
  end

  protected

  attr_reader :name, :numbers
  attr_writer :numbers
end

card = CreditCard.new("CC", 1234567891234567)
card2 = CreditCard.new("CC", 9876543217654321)
card3 = CreditCard.new("ABC", 216536637861738678)

new_card = card.merge_card_account(card2)

p new_card
new_card.print_card_details

# card.merge_card_account(card3)

# card.print_card_details

# 2

# Code Ideas :



