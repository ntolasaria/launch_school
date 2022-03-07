# UPPERCASE = ('A'..'Z').to_a
# LOWERCASE = ('a'..'z').to_a

# def letter_case_count(str)
#   hash = { lowercase: 0, uppercase: 0, neither: 0}
#   str.chars.each do |char|
#     if UPPERCASE.include?(char)
#       hash[:uppercase] += 1
#     elsif LOWERCASE.include?(char)
#       hash[:lowercase] += 1
#     else
#       hash[:neither] += 1
#     end
#   end
#   hash
# end

def letter_case_count(str)
  hash = {}
  characters = str.chars
  hash[:lowercase] = characters.count { |char| char =~ /[a-z]/ }
  hash[:uppercase] = characters.count { |char| char =~ /[A-Z]/ }
  hash[:neither] = characters.count { |char| char =~ /[^a-zA-Z]/ }
  hash


end


p letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
p letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
p letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
p letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }