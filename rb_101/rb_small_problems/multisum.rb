def multisum1(num)
  multiples_5_3 = []
  
  div5 = num / 5
  div3 = num / 3
  div5.times do |n|
    multiples_5_3 << (n+1) * 5
  end
  div3.times do |n|
    multiples_5_3 << (n+1) * 3
  end
  multiples_5_3.uniq.reduce(:+)
end

def multisum2(num)
  sum = 0
  num.times do |number|
    if (number + 1) % 3 == 0 || (number + 1) % 5 == 0
      sum += (number + 1)
    end
  end
  sum
end




puts multisum1(3) == 3
puts multisum1(5) == 8
puts multisum1(10) == 33
puts multisum1(1000) == 234168