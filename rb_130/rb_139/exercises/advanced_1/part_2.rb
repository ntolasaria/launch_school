# # Group 1
# my_proc = proc { |thing| puts "This is a #{thing}." }
# puts my_proc
# puts my_proc.class
# my_proc.call
# my_proc.call('cat')

# => proc { ... } initializes / instantiates a `Proc object`, calling the method `Kernel#proc`
# => Belongs to the class `Proc`
# => When called without argument / lesser argument, error is not raised.
# => missing arguments result in parameters being assigned `nil` interpolated to ''
# => lenient arity
# => #call executes the `Proc`
# ==========================================================================================

# # Group 2
my_lambda = lambda { |thing| puts "This is a #{thing}." }
my_second_lambda = -> (thing) { puts "This is a #{thing}." }
puts my_lambda
puts my_second_lambda
puts my_lambda.class
my_lambda.call('dog')
# my_lambda.call
# my_third_lambda = Lambda.new { |thing| puts "This is a #{thing}." }

# => two ways to initialize a lambda
# => var = lambda { |param| ... }
# => var = -> (param) { ... }
# => lambdas are instances of the `Proc` class
# => lambdas maintain separate identity from a plain Proc. When displaying a lambda, the string contains an (lambda)
# => that is not present in regular Procs
# => #call method executes the lambda
# => when called with fewer arguments, ArgumentError is raised displayimng strict arity
# `Lambda` class does not exist. They belong to the class `Proc`, trying to call `Lambda.new` raises an error
# ==========================================================================================

# # Group 3
# def block_method_1(animal)
#   yield
# end

# block_method_1('seal') { |seal| puts "This is a #{seal}."}
# block_method_1('seal')

# => method which receives a block argument and yields to it 
# => block called with no arguments / fewer arguments. Parameter assigned `nil` and interpolated to ''
# => blocks display lenient arity like procs
# => blocks are unnamed
# => Method that yields to a block must be called with a block else `LocalJumpError` is raised
# => yield can be put in a conditional with `block_given?` to not raise the error
# ==========================================================================================

# Group 4
# def block_method_2(animal)
#   yield(animal)
# end

# block_method_2('turtle') { |turtle| puts "This is a #{turtle}."}
# block_method_2('turtle') do |turtle, seal|
#   puts "This is a #{turtle} and a #{seal}."
# end
# block_method_2('turtle') { puts "This is a #{animal}."}

# => block being passed an argument along with `yield`
# => when lesser arguments are passed, the parameters missing an argument get assigned to `nil`
# => when the block has no parameters, arguments can still be passed but will be ignored.
# => when method argument of the enclosing method are tried to be accessed from within the block,
# => NameError is raised, as it is not in scope / binding of the block.
# ==========================================================================================
