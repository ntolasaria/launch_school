INT = (0..19).to_a
INT_TO_STR = %w(zero one two three four five six seven eight nine ten eleven twelve thirteen fourteen fifteen sixteen seventeen eighteen nineteen)

def alphabetic_number_sort(arr)
  str_arr = []
  str_arr = arr.map {|num| INT_TO_STR[num]}
  sorted_num_arr = str_arr.sort.map {|str| INT[INT_TO_STR.index(str)]}
  sorted_num_arr
end

def alphabetic_number_sort2(arr)
  arr.sort_by {|num| INT_TO_STR[num]}
end


p alphabetic_number_sort2((0..19).to_a)
