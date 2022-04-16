# Given an array of strigs made only from lowercase letters. return an array of all
# characrters that show up in all strings within the given array (including duplicates).
# For example if a character occurs 3 times in all strings but not 4 times, you need to
# include that character three times in the final answer.

# def delete_char(str, char)
#   arr = str.chars
#   arr.delete_at(arr.index(char))
#   arr.join
# end


def common_chars(array)
  arr = array.map { |word| word.dup }

  chars = arr.shift.chars
  chars.select do |char|
    arr.all? { |word| word.sub!(char, '') }
  end

  # characters.each do |char|
  #   if arr.all? { |word| word.sub!(char, '') }
  #     result << char
  #     #arr.map! { |word| word.sub(char, '') }
  #   end
  # end
  # result
end

arr =  ["bella", "label", "roller"]
p common_chars(arr)
p arr
# p common_chars(["bella", "label", "roller"]) == ["e", "l", "l"]
p common_chars(["cool", "lock", "cook"]) == ["c", "o"]
p common_chars(["hello", "goodbye", "booya", "random"]) == ["o"]
p common_chars(["aabbaaaa", "ccdddddd", "eeffee", "ggrrrr", "yyyzzz"]) == []

