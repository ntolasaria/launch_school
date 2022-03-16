LOWERCASE = ('a'..'z').to_a
UPPERCASE = ('A'..'Z').to_a
  
def kebabize(str)
  kebabcase = ''
  str.chars.each do |char|
    if LOWERCASE.include?(char)
      kebabcase << char.downcase
    elsif UPPERCASE.include?(char)
      kebabcase << '-' << char.downcase if kebabcase.size > 0
      kebabcase << char.downcase if kebabcase.size == 0
    end
  end
  kebabcase
end

p kebabize('myCamelCasedString') == 'my-camel-cased-string'
p kebabize('myCamelHas3Humps') == 'my-camel-has-humps'

# **Mental Model:**
# ---
# Examples / Test Cases / Edge Cases
# ----------------------------------
# **Examples:**
# -  Example 1
#   -  Inputs:
#   -  Output:
# -  Example 2
#   -  Inputs:
#   -  Output:
# ---
# _Your Test Cases:_
# -  Example 3
#   -  Inputs:
#   -  Output:
# ---
# _Your Edge Cases:_
# -  Example 4
#   -  Inputs:
#   -  Output:
# ---
# Data Structure
# --------------
# ---
# Algorithm
# ---------
# Code
# ----
# =end

