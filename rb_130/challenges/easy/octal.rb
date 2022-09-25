# class - Octal

# constructor:
# 1 - argument - integer - octal number

# method: to_decimal
# - convert to decimal 
# - example 

# helper method: valid_octal?

# octal 233
# = 2 x 8^2 + 3 x 8^1 + 3 x 8^0
# = 128 + 24 + 3
# = 155

class Octal
  def initialize(octal_num)
    @octal_num = octal_num
  end

  def to_decimal
    return 0 unless valid_octal?

    num = 0
    @octal_num.to_i.digits.each_with_index do |digit, index|
      num += digit * (8 ** index)
    end
    num
  end

  private

  def valid_octal?
    @octal_num =~ /\A[0-7_]+\z/
  end
end

