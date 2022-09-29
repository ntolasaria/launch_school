def running_total1(arr)
  new_arr = []

  arr.size.times do |idx|
    sum = 0
    if idx == 0
      new_arr << arr[idx]
    else
      (0..idx).each do |i|
        sum += arr[i]
      end
      new_arr << sum
    end
  end
  
  new_arr
end


def running_total2(arr)
  new_arr = []
  arr.each_with_index do |val, idx|
    new_arr << arr[0..idx].sum
  end
  new_arr
end



puts running_total2([2, 5, 13]) == [2, 7, 20]
puts running_total2([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
puts running_total2([3]) == [3]
puts running_total2([]) == []