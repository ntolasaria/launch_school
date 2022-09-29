def sequence(num)
  case
  when num < 0  then  (num..-1).to_a
  when num == 0 then  [0]
  else                (1..num).to_a
  end
end


p sequence(5) == [1, 2, 3, 4, 5]
p sequence(3) == [1, 2, 3]
p sequence(1) == [1]
p sequence(0)
p sequence(-5)
