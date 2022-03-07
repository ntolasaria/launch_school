def triangle(size)
  1.upto(size) do |stars|
    puts ('*' * stars).rjust(size)
  end
  size.downto(1) do |stars|
    puts ('*' * stars).ljust(size)
  end
  

end






triangle(5)

#     *
#    **
#   ***
#  ****
# *****

triangle(9)

#         *
#        **
#       ***
#      ****
#     *****
#    ******
#   *******
#  ********
# *********