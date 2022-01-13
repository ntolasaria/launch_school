def egyptian(number)
  denominators = []
  unit_denominator = 1
  until number == 0
    unit_fraction = Rational(1, unit_denominator)
    if unit_fraction <= number
      number -= unit_fraction
      denominators << unit_denominator
    end

    unit_denominator += 1
  end
  denominators
end

def unegyptian(denominators)
  num = 0
  denominators.each do |denominator|
    num += Rational(1, denominator)
  end
  num
end



p egyptian(Rational(2, 1))    # -> [1, 2, 3, 6]
p egyptian(Rational(137, 60)) # -> [1, 2, 3, 4, 5]
p egyptian(Rational(3, 1))    # -> [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 15, 230, 57960]

p unegyptian(egyptian(Rational(1, 2))) == Rational(1, 2)
p unegyptian(egyptian(Rational(3, 4))) == Rational(3, 4)
p unegyptian(egyptian(Rational(39, 20))) == Rational(39, 20)
p unegyptian(egyptian(Rational(127, 130))) == Rational(127, 130)
p unegyptian(egyptian(Rational(5, 7))) == Rational(5, 7)
p unegyptian(egyptian(Rational(1, 1))) == Rational(1, 1)
p unegyptian(egyptian(Rational(2, 1))) == Rational(2, 1)
p unegyptian(egyptian(Rational(3, 1))) == Rational(3, 1)