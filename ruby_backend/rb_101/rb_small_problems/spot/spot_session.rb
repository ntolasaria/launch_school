https://medium.com/launch-school/a-comprehensive-list-of-rb109-practice-problems-other-tips-4a4fbb3cdd7c

https://docs.google.com/document/d/16XteFXEm3lFbcavrXDZs45rNEc1iBxSYC8e4pLhT0Rw/edit#


# https://medium.com/launch-school/a-comprehensive-list-of-rb109-practice-problems-other-tips-4a4fbb3cdd7c

# https://docs.google.com/document/d/16XteFXEm3lFbcavrXDZs45rNEc1iBxSYC8e4pLhT0Rw/edit#

# def test(str)
#   str  += '!'
#   str.downcase!
# end

# test_str = 'Written Assessment'
# test(test_str)

# puts test_str # Written Assessment

# arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

# new_array = arr.each do |n| 
#   n + 1
# end
# p new_array 


# def fix(value)
#  value[1] = 'x' #String#[]=
#  value 
# end

# # s = 'abc'
# # t = fix(s)

# # p t # 'axc'
# # p s # "axc"

# #value['one'] = 'x'


# foo = "foo"
# p foo[1] = 'O' # => ?
# p foo
# # https://ruby-doc.org/core-3.0.0/String.html#method-i-5B-5D-3D


def fix(value)
  value << 'xyz'
  value.concat('!')
  value.upcase
end 

s = 'hello'
t = fix(s)

#https://ruby-doc.org/core-3.0.0/String.html#method-i-upcase

#upcase → new_str
#upcase! → str


# p s #helloxyz
# p t #HELLOXYZ!

p s # => "helloxyz"
p t # => "helloxyz!" 


# p s # "helloxyz!"
# p t # "helloxyz!"

# p s # "HELLOXYZ!"
# p t # "HELLOXYZ!"

# p s # "helloxyz!"
# p t # "helloxyz!"

# p s # "HELLO"
# p t # "HELLOXYZ!"

# TERMINAL -----------------------

Ruby environment ready. Hit run to try out some code!
ruby 2.7.5p203 (2021-11-24 revision f69aeb8314) [x86_64-linux-gnu] 
Everyone can modify this shell in real time.
It's a sandbox that works exactly like a native shell.

[1] 2.7.5 > ruby 2.7.5p203 (2021-11-24 revision f69aeb8314) [x86_64-linux-gnu] 
Everyone can modify this shell in real time.
It's a sandbox that works exactly like a native shell.

[1] 2.7.5 > 

Nimish ran 13 lines of Ruby (finished in 1.61s):

Written Assessment


[1] 2.7.5 > 

Amy D ran 20 lines of Ruby (finished in 1.30s):

[1, 2, 3, 4, 5, 6, 7, 8, 9, 10]


[1] 2.7.5 > 

Dorothy ran 20 lines of Ruby (finished in 780ms):

[2, 3, 4, 5, 6, 7, 8, 9, 10, 11]


[1] 2.7.5 > 

shwetank ran 20 lines of Ruby (finished in 712ms):

[1, 2, 3, 4, 5, 6, 7, 8, 9, 10]


[1] 2.7.5 > 

Gabriel ran 33 lines of Ruby (finished in 890ms):

"axc"
"axc"


[1] 2.7.5 > 

shwetank ran 42 lines of Ruby (finished in 1.86s):



[1] 2.7.5 > 

shwetank ran 42 lines of Ruby (finished in 844ms):

"O"


[1] 2.7.5 > 

shwetank ran 43 lines of Ruby (finished in 800ms):

"O"
"fOo"


[1] 2.7.5 > 

Gabriel ran 55 lines of Ruby (finished in 824ms):

"helloxyz"
"HELLOXYZ!"


[1] 2.7.5 > 

Salo ran 69 lines of Ruby (finished in 807ms):

"helloxyz!"
"helloxyz!"


[1] 2.7.5 > 

Gabriel ran 69 lines of Ruby (finished in 10.81s):

"HELLOXYZ!"
"HELLOXYZ!"


[1] 2.7.5 > 

Gabriel ran 76 lines of Ruby (finished in 724ms):

solution.rb:53: unexpected fraction part after numeric literal
https://ruby-doc.org/core-3.0.0/String.html#method-i-upcase
                             ^~



[1] 2.7.5 > 

Gabriel ran 76 lines of Ruby (finished in 1.24s):

"helloxyz"
"HELLOXYZ!"


[1] 2.7.5 > 

Dorothy ran 76 lines of Ruby (finished in 812ms):

"helloxyz!"
"HELLOXYZ!"


[1] 2.7.5 > 

Dorothy ran 75 lines of Ruby (finished in 1.26s):

"helloxyz!"
"HELLOXYZ!"


[1] 2.7.5 > 

Dorothy ran 75 lines of Ruby (finished in 1.08s):

"helloxyz!"
"HELLOXYZ!"


[1] 2.7.5 > 

Salo ran 75 lines of Ruby (finished in 861ms):

"helloxyz!"
"helloxyz!"


[1] 2.7.5 > 

Salo ran 75 lines of Ruby (finished in 842ms):

"helloxyz!"
"HELLOXYZ!"


[1] 2.7.5 > 

Salo ran 75 lines of Ruby (finished in 1.33s):

"helloxyz!"
"helloxyz!"


[1] 2.7.5 > 

Salo ran 75 lines of Ruby (finished in 969ms):

"helloxyz!"
"HELLOXYZ!"


[1] 2.7.5 > 