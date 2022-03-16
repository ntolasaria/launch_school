# My solution

def longest(s)
  arr = s.chars
  idx_arr = arr.map.with_index do |char, i|
    length = 1
    while i < arr.size - 1
      break if arr[i] > arr[i + 1]
      i += 1
      length += 1
    end
    length
  end
  max_length = idx_arr.max
  arr[idx_arr.index(max_length), max_length].join
end

# Codewars 

def longest(str)
  str.chars.slice_when { |a, b| a > b }
           .max_by(&:size)
           .join
end