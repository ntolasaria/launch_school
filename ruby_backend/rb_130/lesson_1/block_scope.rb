# level_1 = "outer_most variable"

# [1, 2, 3].each do |n|
#   level_2 = "inner variable"

#   ['a', 'b', 'c'].each do |n2|
#     level_3 = "inner_most_variable"

#     # all three variables accessible here
#   end

#   # level_1 - accessible
#   # level_2 - accessible
#   # level_3 - not accessible
# end

# # level_1 - accessible
# # level_2 - not accessible
# # level_3 - not accessible

# Chunk of code - Proc, lambda or block

name = "Robert"
chunk_of_code = Proc.new { puts "hi #{name}" }
name = "Griffin III"

def call_me(some_code)
  some_code.call
end

call_me(chunk_of_code)