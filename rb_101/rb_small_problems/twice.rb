def double_number?(int)
  int_str = int.to_s
  size = int_str.size
  size.even? && int_str.slice(0, size / 2) == int_str.slice(size / 2, size / 2)
end

def twice(int)
  if double_number?(int)
    int
  else
    int * 2
  end
end

p twice(37) == 74
p twice(44) == 44
p twice(334433) == 668866
p twice(444) == 888
p twice(107) == 214
p twice(103103) == 103103
p twice(3333) == 3333
p twice(7676) == 7676
p twice(123_456_789_123_456_789) == 123_456_789_123_456_789
p twice(5) == 10
p twice(1)