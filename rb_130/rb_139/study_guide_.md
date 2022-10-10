#  Study guide for RB139 Assessment
  
  
##  Blocks
  
  
####  Closures, binding, and scope
  
  
###  Closures:
  
- A closure is a general programming concept that allows a programmer to save a "chunk of code" and execute it at a later time.
- It's called a closure because it binds its surrounding artifacts (ie, names like variables and methods) and builds an enclosure around everything so that they can be referenced when the closure is later executed.
- It can also be thought of as a method you can pass around and execute.
  
Ruby implements cloures through:
- instantiating an object from the `Proc` class
- using lambdas
- using blocks
  
It is different to just creating a method and calling that later. It can be passed into existing methods. It retains references to its surrounding artifacts - its **binding**.
  
###  Binding
  
  
Closures retains references to its surrounding artifacts, thats is variables, objects etc. This is called its binding.
  
Example:
  
```ruby
def call_me(some_code)
  some_code.call
end
  
name = "Robert"
chunk_of_code = Proc.new { puts "hi #{name}" }
name = "Griffin III"          # re-assign name after Proc initialization
  
call_me(chunk_of_code)
```
  
The output is
  
```bash
hi Griffin III
=> nil
```
  
The `Proc` is aware of the new value even though the variable was reassigned after the Proc was defined. This implies that the Proc keeps track of its surrounding context and drags it around wherever the chunk of code is passed to. In Ruby this is called its binding pr surrounding enviornment / context. A closure must keep track of its binding in order to have all the information it needs in order to be executed later. This includes local variables, method references, constants and other artifacts in the code - whatever it needs to execute correctly, it will drag all of it around. That is why the above code works the way it does seemingly violating the variable scoping rules we learned earlier. All variables that need to accessed in the closure must be defined / initialized before the closure is created.
  
Binding and closures is why "inner scopes can access outer scopes". 
  
  
###  Scope
  
  
  
  
  
####  How blocks work, and when we want to use them.
  
  
###  Blocks:
  
Blocks are defined by either `{ ... }` or `do ... end`.
  
Example:
```ruby
[1, 2, 3].each do |num|
  puts num
end
```
  
Here the `each` method is called on the `Array` object and the `do ... end` part which is the block is passed as an argument.
  
  
####  Blocks and variable scope
  
  
Local variable scope with blocks:
  
```ruby
level_1 = "outer-most variable"
  
[1, 2, 3].each do |n|             # block creates new scope
  level_2 = "inner variable"
  
  ['a', 'b', 'c'].each do |n2|  # nested block creates nested scope
    level_3 = "inner_most variable"
  
    # all three level_x variables are accessible here
  end
  
  # level_1 - accessible
  # level_2 - accessible
  # level_3 - not accessible
end
  
# level_1 - accessible
# level_2 - not accessible
# level_3 - not accessible
```
  
This is only for local variables and not methods. This can be confusing.
  
  
####  Write methods that use blocks and procs
  
  
In Ruby, every method we have ever written can take a block as an implicit argument.
  
Example:
  
```ruby
def hello
  "hello!"
end
  
hello("hi")             # => ArgumentError
hello { puts 'hi' }     # => "hello!"
```
  
Calling `hello` with the wrong number of arguments raises an error, however calling it with a block does not raise an error and the method is invoked.
  
###  Yielding
  
One way to invoke the passed in block argument from within the method is by using `yield` keyword.
  
Example:
```ruby
def echo_with_yield(str)
  yield
  str
end
  
echo_with_yield { puts "world" }                      # => ArgumentError
echo_with_yield("hello!") { puts "world" }            # world
                                                      # => "hello!"
echo_with_yield("hello", "world!") { puts "world" }   # ArgumentError
```
  
The number of arguments with the method call must match the method definition exactly. The `yield` keyword executes the block that is passed in.'
  
Now, if the method is called as follows:
  
```ruby
echo_with_yield("hello!")         # LocalJumpError: no block given (yield)
```
  
This is because `yield` is used within the method definition but no block has been given at the time of method invocation.
  
This can be addressed we can wrap the `yield` call in a conditional. Only call `yield` if a block is passed and call if no block is passed. Then the method can be called with or without the block. This can be done with the `Kernel#block_given?` method. 
  
```ruby
def echo_with_yield(str)
  yield if block_given?
  str
end
  
echo_with_yield("hello!")                       # "hello!"
echo_with_yield("hello!") { puts "world" }      # world
                                                # => "hello!"
```
  
Sequnce of code execution when yielding to a block:
  
```ruby
1 |# method implementation
2 |def say(words)
3 |  yield if block_given?
4 |  puts ">" +  words
5 |end
6 |
7 |# method invocation
8 |say("hi there") do
9 |  system 'clear'
10|end                       # clears screen first, then outputs "> hi there"
```
- execution starts at line 8. `say` is invoked with two arguments - a string and a block
- execution goes to line 2, local variable `words` is assigned to the string `"hi there"`. The block is passed implicitly without being assigned to a variable.
- execution continues to line 3, which yields to the block as the method `block_given?` returns `true`
- the block, line 9 is excuted which clears the screen.
- after the block is done executing, execution continues in the method implementation on line 4. Executing line 4 results in the `">hi there"` being output.
- the method ends, and `nil` is returned as that is what is returned by `puts` being the last line of the method.
  
The trace is as follows:
line 8 -> line 2 -> line 3 -> line 9 -> line 4 -> line 5
  
Notice the jump after line 3. Execution jumps to the block and comes back to finish the rest of the method. This is similar to calling a method, except here a block is called. Sometimes block can be thought of as an unnamed method. 
  
**Yielding with an argument**
  
Example:
  
```ruby
3.times do |num|
  puts num
end
```
  
`3` is the calling object.
`.times` is the method being called.
`do ... end` is the block. The `num` variable between two `|`s is the block parameter. Within the block, `num` is a block local variable. This is a special type of local variable where the scope is constrained to the block.
  
Block parameter should have a unique name, otherwise variable shadowing might take place.
  
Example of a custom method that takes a block:
  
```ruby
1 | # method implemnetation
2 | def increment(number)
3 |   if block_given?
4 |     yield(number + 1)
5 |   end
6 |   number + 1
7 | end
8 |
9 | # method invocation
10| increment(5) do |num|
11|   puts num
12| end
```
  
Trace of the code execution:
- execution starts at method invocation on line 10.
- moves to method implementation on line 2. `number` is assigned to `5`, and the block is implicitly passed.
- continues to line 3, which is a conditional
- conditional is true, moves to line 4
- On line 4 execution is yielded to the block (or the block is called), `number + 1` is passed to the block, which means the block is called with `6` as the block argument.
- execution jumps to line 10, where `num` is assigned to `6`.
- `num` is available as block local variable. Continues to line 11, where the object referenced by `num` is output.
- continues to line 12, where the end of block is reached.
- execution jumps back to method implementation, where line 4 is just executed.
- continues to line 5, the end of the `if`.
- continues to line 6, where the value `number + 1` is returned to line 10.
- the program ends (the return value of the `#increment` is not used)
  
Sequence is as follows:
  
Line 10 -> 2 -> 3 -> 4 -> 10 -> 11 -> 12 -> 4 -> 5 -> 6 -> 10
  
So, it can be seen that calling a block is almost like calling another method. In this case, we are also passing an argument to the block. So, if we pass in the wrong number of arguments we would expect Ruby to raise an `Argument Error`. Lets, see an example:
  
```ruby
def test
  yield(1, 2)
end
  
test { |num| puts num }         # 1
```
  
Surprisingly, `1` is output. The extra block argument is ignored. Now, lets see by passing in fewer arguments
  
```ruby
def test
  yield(1)
end
  
test do |num1, num2|
  puts "#{num1} #{num2}"        # 1
end
```
  
This also outputs `1`. But here, `num2` block variable is `nil` so the string interpolation converts that to an empty string which is why `1` is output with an extra space.
  
**Arity**
The rule regarding the number of arguments that you must pass to a block, `proc` or `lambda` in Ruby is called its arity. In Ruby, blocks and `proc`s have lenient arity which is why an expception is not raised whern you pass in too many or too few arguments to a block. Methods and `lambda`s on the hand have strict arity, which means you must pass the exact number of arguments that the method or `lambda` expects. In short, methods enforce argument count while blocks do not.
  
  
**Return value of yielding**
  
```ruby
def compare(str)
  puts "Before: #{str}"
  after = yield(str)
  puts "After: #{after}"
end
  
compare('hi') { |word| word.upcase }
  
```
  
This outputs `"Before: hi"` and `"After: HI"`. It can be seen that like methods, blocks have a return value which is also the return value of the last statement executed in the block. This return value is assgined to the local variable `after` above.
  
**When to use blocks in your own methods**
  
There two roles involved with any method. Method implementor and method caller. Sometimes, the implementor is not 100% certain how the method will be called. He can leave some of the decision to the caller at the time of invocation by way of using blocks.
  
1. Defer some implementation code to method invocation decision.
  
The compare method above can be implemented without the use of blocks. An example with similar functionality is as follows:
  
```ruby
def compare(str, flag)
  after = case flag
          when :upcase
            str.upcase
          when :capitalize
            str.capitalize
            # there can be many clauses here....
          end
  
  puts "Before: #{str}"
  puts "After: #{after}"
end
  
compare("hello", :upcase)
  
# Before: hello
# After: HELLO
# => nil
```
  
But this is not as flexible as allowing method callers to refine the method implementaion without actually modifiying the method implementation for every one else. By using blocks, the method implementor can defer the decision of which flags to support and let the method caller decide at the time of invocation. 
  
Many of the core library's most useful methods are built in this way. Like `Array#each`, `Array#select`, `Array#map`.
  
If you encounter a scenario where you're calling a method from multiple places with one little tweak in each casem it may be a good idea to try implementing the method in a generic way by yielding to a block.
  
2. Methods that need to perfom some "before" and "after" actions - sandwich code.
  
Sandwich code is a good use cade for methods using blocks. Sometimes, a generic method is needed which performs some before and after action. The method implementor doesn't care before and after what. Example:
  
```ruby
def time_it
  time_before = Time.now
  yield                               # execute the implicit block
  time_after = Time.now
  
  puts "It took #{time_after - time_before} seconds."
end
  
time_it { sleep(3) }
  
time_it { "hello world" }
```
  
####  Understand that methods and blocks can return chunks of code (closures)
  
  
**Using Closures**
  
Closures are formed by blocks, `Proc` objects an `lambda`s. They retain a memory of their surrounding scope and can use and even update variables in that scope when they are executed, even if the closure is called from somewhere else. Example:
  
```ruby
def for_each_in(arr)
  arr.each { |element| yield(element) }
end
  
arr = [1, 2, 3, 4, 5]
result = [0]
  
for_each_in(arr) do |number|
  total = result[-1] + number
  result.push(total)
end
  
p result   # => [0, 1, 3, 6, 10, 15]
```
  
Even though the block passed to `for_each_in` is invoked inside the method, the access to the `results` array is retained. 
  
Also, closures can be returned by a method. Blocks cannot be returned however, `Proc`s and `lambda`s can.
  
Example:
  
```ruby
def sequence
  counter = 0
  Proc.new { counter += 1 }
end
  
s1 = sequence
p s1.call       # => 1
p s1.call       # => 2
p s1.call       # => 3
puts
  
s2 = sequence
p s2.call      # => 1
p s2.call      # => 2
puts
  
p s1.call      # => 4
```
  
Here, the method `sequence` returns `Proc` object that forms a closure with local variable `counter`. This returned `Proc` can be called repeatedly. Each time it is called, it increments its own private copy of the `counter` variable. Thus returning `1`, `2` and `3` on the first, second and third calls respectively.
  
We can also create multiple `Proc`s from `sequence` and each will have its own independent copy of `counter`. Thus when the method `sequence` is called for the second time and the return value is assigned to `s2`, the `counter` associated with `s2` is separate and independent of the `counter` in `s1`.
  
  
  
####  Methods with an explicit block parameter
  
  
Every method can take an implicit block argument. It might ignore the implicit block but yet it takes it.
  
Methods can also be made to take an explicit block. Explicit block is a block that gets treated as a named object, that is it gets assigned to a method parameter so that it can be managed like any other object. It can be reassigned, passed to other methods and invoked many times. In order to define an explicit block, a parameter must be added to the method definition where the name begins with the `&` character.
  
```ruby
def test(&block)
  puts "What;s &block? #{block}" 
end
```
  
`&block` is a special paramater that converts the block argument to a `Proc` object. Notice we drop the `&` when referring to the parameter inside the method. This what happens when the method is invoked:
  
```ruby
test { sleep(1) }
  
# What's &block? #<Proc:0x007f98e32b83c8@(irb):59>
# => nil
```
  
`block` local variable is now a `Proc` object. It can be named whatever, just as long as it is defined with a leading `&`.
  
Using a block with an explicit parameter provides added flexibility. It can also be passed around to other methods.
  
```ruby
def test2(block)
  puts "hello"
  block.call(">>>")
  puts "good-bye"
end
  
def test(&block)
  puts "1"
  test2(block)
  puts "2"
end
  
test { |prefix| puts prefix + "xyz" }
# 1
# hello
# >>>xyz
# good-bye
# 2
```
  
We only have to use `&` for the `block` parameter in `#test`. Since `block` is already a `Proc` object when we call `test2`, no conversion is needed.
  
The string `">>>"` is passed as an argument to the block which is assigned to the block parameter.
  
Arguments can be passed to the explicit block by using them as arguments to `call`.
  
####  Arguments and return values with blocks
  
####  When can you pass a block to a method
  
  
  
####  &:symbol
  
  
The following code:
  
```ruby
[1, 2, 3, 4, 5].map do |num|
  num.to_s
end
  
# => ["1", "2", "3", "4", "5"]
```
  
can be rewritten in shorter way like:
  
```ruby
[1, 2, 3, 4, 5].map(&:to_s)     # => ["1", "2", "3", "4", "5"]
```
  
This shortcut however, cannot be used on methods that take an argument.
  
Basicaly `(&:to_s)` gets converted to `{ |n| n.to_s }`. 
  
The above code iterates through every element and calls the method `to_s` on it, then saves the result in a new array.
  
When `&` is applied, Ruby tries to convert the object to a block. That's easy if the object is a Proc as Ruby narturally converts a Proc to a block. However, if the object is not a Proc, we have to first convert it to a Proc. In that we case `#to_proc` must be called on the object which returns a Proc. Then the resulting Proc can be converted into a block. In the example of `&:to_s`, Ruby is being told to convert the Symbol `to_s` to a block. To do that, it first calls `Symbol#to_proc` to convert the symbol to a Proc, and it then converts the Proc to a block.
  
Basically what is happening is as follows:
  
```ruby
def my_method
  yield(2)
end
  
# turns the symbol into a Proc, then `&` turns the Proc into a block
my_method(&:to_s)                 # => "2"
```
The above code can be broken into 2 steps as follows:
  
```ruby
def my_method
  yield(2)
end
  
a_proc = :to_s.to_proc      # explicitly call to_proc on the symbol
my_method(&a_proc)          # convert Proc into block, then pass the block in the method which returns "2"
```
  
  
####  Arity of blocks and methods
  
  
```ruby
def test
  yield(1, 2)
end
  
test { |num| puts num }         # 1
```
  
Surprisingly, `1` is output. The extra block argument is ignored. Now, lets see by passing in fewer arguments
  
```ruby
def test
  yield(1)
end
  
test do |num1, num2|
  puts "#{num1} #{num2}"        # 1
end
```
  
This also outputs `1`. But here, `num2` block variable is `nil` so the string interpolation converts that to an empty string which is why `1` is output with an extra space.
  
**Arity**
The rule regarding the number of arguments that you must pass to a block, `proc` or `lambda` in Ruby is called its arity. In Ruby, blocks and `proc`s have lenient arity which is why an expception is not raised whern you pass in too many or too few arguments to a block. Methods and `lambda`s on the hand have strict arity, which means you must pass the exact number of arguments that the method or `lambda` expects. In short, methods enforce argument count while blocks do not.
  
  
##  Testing With Minitest
  
  
####  Testing terminology
  
  
**Test Suite:** this represents all the tests for a project / application.
  
**Test:** this describes a situation or context in which tests are run. Example, this test is about making sure you get an error message after trying to log in with the wrong password. A test can contain multiple assertions.
  
**Assertion:** this is the actual verfication step to confirm that the data returned by the program is actually what is expected.
  
  
####  Minitest vs. RSpec
  
####  SEAT approach
  
####  Assertions
  
  
| **Assertion**                     | **Description**                           |
|:----------------------------------|:------------------------------------------|
| `assert(test)`                    | Fails unless `test` is truthy.            |
| `assert_equal(exp, act)`          | Fails unless `exp == act`.                |
| `assert_nil(obj)`                 | Fails unless `obj` is `nil`.              |
| `assert_raises(*exp) { ... }`     | Fails unless block raises one of `*exp`.  |
| `assert_instance_of(cls, obj)`    | Fails unles `obj` is an instance of `cls`.|
| `assert_includes(collecion, obj)` | Fails unless `collection` includes `obj`. |
  
##  Core Tools/Packaging Code
  
  
####  Purpose of core tools
  
####  Gemfiles
  
  