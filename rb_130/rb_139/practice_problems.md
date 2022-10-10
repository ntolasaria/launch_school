#### Problem
```ruby
def call_this
	yield(2)
end
```

##### How to get the following return values with modifying the method invocation nor the method definition

```ruby
call_this(&to_s) # => returns 2
call_this(&to_i) # => returns "2"
```

#### Solution
```ruby
to_s = Proc.new { |n| n.to_i }  # define these before
to_i = Proc.new { |n| n.to_s }
```

#### Different way to think about `&`

We can think of `&` as doing 3 (or maybe 2-1/2) different, but related things. What it does depends on where it is and what comes after it.

1. Can be in method definition, prepended on a parameter name
    1. Here, `&` will take a block, convert it into a `Proc` and assign it to the parameter name
2. Can be in method invocation, prepended on an argument
    1. Here it takes a `Proc` and converts it to a block to be passed as an argument
    2. But, if what comes after is NOT a `Proc` it will call `to_proc` on that object and then proceed with converting it to a block to be passed

# BLOCKS

#### 1, What are closures?

**Answer:**

A closure is a programming concept which allows us to save a chunk of code and execute it a later time. It's called a closure because it binds its surrounding artifacts (variables, methods etc.) and builds an enclosure around everything so that they can be referenced when the closure is exeecuted later.

It can also be thought of as an unnamed method which can be passed around and executed.

Ruby implements closure through:
- `Proc` objects
- blocks
- lambdas

#### 2, What is binding?

**Answer:**

Closures retain references to its surrounding artifacts, that is variables, objects, methods etc. This is called its binding. 

Example:

```ruby
def a_method
  yield
end

name = "Robert"
chunk_of_code = Proc.new { puts "Hi #{name}" }
name = "Downey"

a_method(&chunk_of_code)
```

The output is `"Hi Downey"`, this implies that the `Proc` `chunk_of_code` retains reference to the variable `name` and is aware when `name` is reassigned to `"Downey"`.


#### 3, How does binding affect the scope of closures?

**Answer:**

Bindind affects the scope of closures. It can be seen in the above example that because of the binding of `chunk_of_code` the variable `name` was referenced from within the method `a_method` which wouldnt otherwise happen unless the `name` is explicitly passed to the method as an argument. Binding and closures are at the core of variable scoping rules in Ruby. It's why inner scopes can access outer scopes".

#### 4, How do blocks work?

**Answer:**

Blocks are an unnamed chunk of code in Ruby. They are written between `do ... end` or `{ ... }`. 

Blocks create a new scope, wherein the variables initialized within the blocks are not available for use outside of it.

Blocks are passed to a method as arguments, and the method implementation decides what is done with the chunk of code (block).

Example:

```ruby
[1, 2, 3].each do |num|
  puts num
end
```

In this case the method `each` is called on the array `[1, 2, 3]` and the block following that is passed as an argument, which is the code between `do ... end`. Here the block has one block parameter `num` which is avialable as local variable within the block. In this case the method `each` iterates through the elements of the array and simply executes the block, assigning the respective element to the block parameter on every iteration. This is results in the output `1`, `2`, `3` in that order. The method `each` returns the object it was called on, in this case being `[1, 2, 3]`.

#### 5, When do we use blocks? (List the two reasons)

**Answer:**

Blocks are used in Ruby for the following two reasons:

- When the method implementer wants to leave some executing details to the method caller. The method can be defined in a generic way and the method caller can pass a block and make the method work for them in the way desire.
- For something called 'sandwich code'. Here the method simply does something before and after a certain chunk of code is executed. The chunk of code is passed in at the time of calling the method. The method implementation is concerened with the before and after part and not about the code in between.

#### 6, Describe the two reasons we use blocks, use examples.

**Answer:**

Examples for the reasons in the answer 5.

First:

If we have a method, which lets us pass a string and a block which calls a method on the string and manipulates it as required.

```ruby
def compare(str)
  puts "Before: #{str}"
  after = yield(str)
  puts "After: #{after}"
end

compare("hi") { |word| word.upcase }
```

This method can be implemented without passing block as well by passing flags for particular methods to be called on the string, like follows:

```ruby
def compare(str, flag)
  after = case flag
          when :upcase
            str.upcase
          when :downcase
            str.downcase
            # as many clauses as desired
          end
  puts "Before: #{str}"
  puts "After: #{after}"
end

compare ("hi", :upcase)
```

The problem is that here all the flags must be decided at the time of method implementation. When using blocks, the methods to be used on the string can be decided at the time of calling the method.

Second:

If we need a method to calculate the time taken to execute some code by recording the time before and after execution. It can be done as follows:

```ruby
def time_it
  start = Time.now
  yield
  finish = Time.now
  puts "The time taken is #{finish - start} seconds"
end

time_it { sleep (3.0) }
```

#### 7, When can you pass a block to a method? Why?

**Answer:** 

The above scenarios. 

Also, every method in Ruby can taken an implicit block. 

#### 8, How do we make a block argument manditory?

**Answer:**

A block argument can be made mandatory by yielding to a block within the method body and not using any conditional which checks whether a block is passed as an argument or not. Not passing a block will raise a `LocalJumpError`. 

#### 9, How do methods access both implicit and explicit blocks passed in?

**Answer:**

Blocks can be passed to methods implicitly and explicitly. For implicit blocks, the method accesses the block by yielding to the block. Example:

```ruby
def a_method(str)
  yield(str)
end

a_method("hello") { |word| puts word.upcase }

```

Here, the block passed implicity is accessed by `yield` and `str` is passed to the block.

Explicit blocks can be accessed by either yielding or calling the method `call` as demonstrated below:

```ruby
def a_method(str, &block)
  block.call(str)
  yield(str)
end

a_method("hello") { |word| puts word.upcase }
```

Here, the parameter `&block` takes a block and converts it to a Proc and assigns it to the local variable `block`. This can be called by calling the method `call` on `block` and passing the argument as required. Also, since a block is passed to the method it can be accessed by simply yielding to it as well.


#### 10, What is `yield` in Ruby and how does it work?

**Answer:**

The `yield` keyword can be used within methods. What it does is simply execute the block that is passed to the method as an argument. `yield` also has a return value which is the same as the return value of the block being yielded to. 

#### 11, How do we check if a block is passed into a method?

**Answer:**

The method `block_given?` checks if a block is passed in to a method. It returns `true` if a block is passed and `false` if not.


#### 12, Why is it important to know that methods and blocks can return closures?

Closures cannot only be passed into methods. Some closures like `Proc`s and lambdas can be returned by methods as well. This closure can then be assigned to variables and be used in several ways. An example is demonstrated below, where suppose we need multiple counters in our program

```ruby
def counter
  count = 0
  Proc.new { count += 1 }
end

c1 = counter
c1.call       # => 1
c1.call       # => 2

c2 = counter
c2.call       # => 1

c1.call       # => 3
```

It can be seen that the method `counter` returns a `Proc` which retains refernce to the local variable `count`. Every time a the method is called a new independent copy of the variable `count` is created. This is demonstrated by the increments when the method `call` is called on `c1` and `c2` respectively.

#### 13, What are the benifits of explicit blocks?

**Answer:**

14, Describe the arity differences of blocks, procs, methods and lambdas.

15, What other differences are there between lambdas and procs? (might not be assessed on this, but good to know)

16, What does `&` do when in a the method parameter?

```ruby
def method(&var); end
```

17, What does `&` do when in a method invocation argument?

```ruby
method(&var)
```

18, What is happening in the code below?

```ruby
arr = [1, 2, 3, 4, 5]

p arr.map(&:to_s) # specifically `&:to_s`
```

19, How do we get the desired output without altering the method or the method invocations?

```ruby
def call_this
  yield(2)
end

# your code here

p call_this(&to_s) # => returns 2
p call_this(&to_i) # => returns "2"
```

20, How do we invoke an explicit block passed into a method using `&`? Provide example.

21, What concept does the following code demonstrate?

```ruby
def time_it
  time_before = Time.now
  yield
  time_after= Time.now
  puts "It took #{time_after - time_before} seconds."
end
```

22, What will be outputted from the method invocation `block_method('turtle')` below? Why does/doesn't it raise an error?

```ruby
def block_method(animal)
  yield(animal)
end

block_method('turtle') do |turtle, seal|
  puts "This is a #{turtle} and a #{seal}."
end
```

23, What will be outputted if we add the follow code to the code above? Why?

```ruby
block_method('turtle') { puts "This is a #{animal}."}
```

24, What will the method call `call_me` output? Why?

```ruby
def call_me(some_code)
  some_code.call
end

name = "Robert"
chunk_of_code = Proc.new {puts "hi #{name}"}
name = "Griffin"

call_me(chunk_of_code)
```

25, What happens when we change the code as such:

```ruby
def call_me(some_code)
  some_code.call
end

chunk_of_code = Proc.new {puts "hi #{name}"}
name = "Griffin"

call_me(chunk_of_code)
```

26, What will the method call `call_me` output? Why?

```ruby
def call_me(some_code)
  some_code.call
end

name = "Robert"

def name
  "Joe"
end

chunk_of_code = Proc.new {puts "hi #{name}"}

call_me(chunk_of_code)
```

27, Why does the following raise an error?

```ruby
def a_method(pro)
  pro.call
end

a = 'friend'
a_method(&a)
```

28, Why does the following code raise an error?

```ruby
def some_method(block)
  block_given?
end

bl = { puts "hi" }

p some_method(bl)
```

29, Why does the following code output `false`?

```ruby
def some_method(block)
  block_given?
end

bloc = proc { puts "hi" }

p some_method(bloc)
```

30, How do we fix the following code so the output is `true`? Explain

```ruby
def some_method(block)
  block_given? # we want this to return `true`
end

bloc = proc { puts "hi" } # do not alter this code

p some_method(bloc)
```

31, How does `Kernel#block_given?` work?

32, Why do we get a `LocalJumpError` when executing the below code? &
How do we fix it so the output is `hi`? (2 possible ways)

```ruby
def some(block)
  yield
end

bloc = proc { p "hi" } # do not alter

some(bloc)
```

33, What does the following code tell us about lambda's? (probably not assessed on this but good to know)

```ruby
bloc = lambda { p "hi" }

bloc.class # => Proc
bloc.lambda? # => true

new_lam = Lambda.new { p "hi, lambda!" } # => NameError: uninitialized constant Lambda
```

34, What does the following code tell us about explicitly returning from proc's and lambda's? (once again probably not assessed on this, but good to know ;)

```ruby
def lambda_return
  puts "Before lambda call."
  lambda {return}.call
  puts "After lambda call."
end

def proc_return
  puts "Before proc call."
  proc {return}.call
  puts "After proc call."
end

lambda_return #=> "Before lambda call."
              #=> "After lambda call."

proc_return #=> "Before proc call."

```

35, What will `#p` output below? Why is this the case and what is this code demonstrating?

```ruby
def retained_array
  arr = []
  Proc.new do |el|
    arr << el
    arr
  end
end

arr = retained_array
arr.call('one')
arr.call('two')
p arr.call('three')
```

# TESTING WITH MINITEST

36, What is a test suite?

37, What is a test?

38, What is an assertion?

39, What do testing framworks provide?

40, What are the differences of Minitest vs RSpec

41, What is Domain Specific Language (DSL)?

42, What is the difference of assertion vs refutation methods?

43, How does assert_equal compare its arguments?

44, What is the SEAT approach and what are its benefits?

45, When does setup and tear down happen when testing?

46, What is code coverage?

47, What is regression testing?

# CORE TOOLS

48, What are the purposes of core tools?

49, What are RubyGems and why are they useful?

50, What are Version Managers and why are they useful?

51, What is Bundler and why is it useful?

52, What is Rake and why is it useful?

53, What constitues a Ruby project?