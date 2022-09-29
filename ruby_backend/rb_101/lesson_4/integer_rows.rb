def integer_row_sum(int)
  arr = []
  integer = 2
  int.times do |row_index|
    sub_arr = []
    while row_index >= 0
      sub_arr << integer
      integer += 2
      row_index -= 1
    end
    arr << sub_arr
  end
  arr.last.sum
end

def integer_row_sum_nt(int)
  integer = 2
  row_sum = 0
  int.times do |row_index|
    row_sum = 0 
    while row_index >= 0
      row_sum += integer
      integer += 2
      row_index -= 1
    end
  end
  row_sum
end



puts integer_row_sum(1000) # 11.44 seconds for 19999
# puts integer_row_sum_nt(19999) # 7.46 seconds for 19999