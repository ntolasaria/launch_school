def buy_fruit(arr)
  result = []
  arr.each do |array|
    array[1].times { result << array[0]}
  end
  result
end

p buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) #==
  #["apples", "apples", "apples", "orange", "bananas","bananas"]
