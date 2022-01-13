arr_hash = [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}]

# arr = arr_hash.map do |hash|
#   hash.to_a
# end

# p arr

# new_arr = arr.map do |array|
#   #p array
#   array.map do |array2|
#     array2.map do |el|
#       if el.class == Array
#         el.map do |el2|
#           if el2.class == Integer
#             el2 + 1
#           else
#             el2
#           end
#         end
#         else
#           if el.class == Integer
#             el + 1
#           else
#             el
#           end
#         end
#       end
#   end
# end

# hash_arr = new_arr.map do |array|
#   array.to_h
# end

# p hash_arr

# BETTER SOLUTION 

new_arr_hash = arr_hash.map do |hash|
  new_hash = {}
  hash.each do |k, val|
    new_hash[k] = val + 1
  end
  new_hash
end

p new_arr_hash
