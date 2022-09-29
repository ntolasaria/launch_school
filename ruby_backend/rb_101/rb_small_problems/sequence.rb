# def sequence(int)
#   (1..int).to_a
# end

def sequence(count, int)
  result = []
  (1..count).each do |count|
    result << int * count
  end
  result
end

# p sequence(5) == [1, 2, 3, 4, 5]
# p sequence(3) == [1, 2, 3]
# p sequence(1) == [1]

p sequence(5, 1) == [1, 2, 3, 4, 5]
p sequence(4, -7) == [-7, -14, -21, -28]
p sequence(3, 0) == [0, 0, 0]
p sequence(0, 1000000) == []