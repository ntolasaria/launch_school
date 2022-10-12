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

Blocks in Ruby can be passed explicitly to methods. In order to this `&` must be prepended to the name of the argument. This converts the block to a `Proc` object and assigns it to the parameter. This can then be managed as a named object, giving us the flexibility to call, reassign, call mutiple times and passed to other methods. An example demonstrating this is below, where the the explicit block is pased to another method.

```ruby
def test2(block)
  puts "start method test2"
  block.call
  puts "finish method test2"
end

def test(&block)
  puts "start method test"
  test2(block)
  puts "finish method test"
end

test { puts "Test String!!!" }
```

Here, the block is converted to a Proc and assigned to the parameter `block` of method `test`. Within `test`, the method `test2` is invoked where the Proc referenced by `block` is passed as an argument.

The output is as follows:

```bash
start method test
start mehtod test2
Test String!!!
finish method test2
finish method test
```

#### 14, Describe the arity differences of blocks, procs, methods and lambdas.

15, What other differences are there between lambdas and procs? (might not be assessed on this, but good to know)

#### 16, What does `&` do when in a the method parameter?

```ruby
def method(&var); end
```

**Answer:**

When `&` is prepended to a method parameter, it takes a block passed to the method, converts it to a `Proc` object and assigns it to the parameter. The `Proc` is then available for use within the method body.

17, What does `&` do when in a method invocation argument?

```ruby
method(&var)
```

#### 18, What is happening in the code below?

```ruby
arr = [1, 2, 3, 4, 5]

p arr.map(&:to_s) # specifically `&:to_s`
```

**Answer:**

Here, the method `map` is called on the array referenced by `arr` which is `[1, 2, 3, 4, 5]` and the the block `&:to_s` is passed as an argument. 

What is happening here is that `&` is prepended to a `symbol`. What this does is convert the object to a block. If the object is a Proc then Ruby naturally converts it to a block, if not the method `Symbol#to_proc` is called to convert the symbol to `Proc` and then it is converted to a block. Basically, `(&:to_s)` gets trasformed to `{ |n| n.to_s }`. 

Hence, here a new array is returned where the method `to_s` is called on each of the elements. The returned array is `['1', '2', '3', '4', '5']`.

#### 19, How do we get the desired output without altering the method or the method invocations?

```ruby
def call_this
  yield(2)
end

# your code here
to_s = Proc.new { |n| n.to_i }
to_i = Proc.new { |n| n.to_s }

p call_this(&to_s) # => returns 2
p call_this(&to_i) # => returns "2"
```

#### 20, How do we invoke an explicit block passed into a method using `&`? Provide example.

**Answer:**

When a method takes an explicit block with `&` prepended to the name of the parameter, the block gets converted to a `Proc` object and is assigned to the parameter. The proc can be called by calling the method `call`. Also, since a block is passed to a method, it can also be called using the `yield` keyword.

Examples:
```ruby
def a_method(&block)
  block.call
  yield
end

a_method { puts "A block is called!" }

```

Here, the block passed to the method `a_method` is called twice, once by invoking the method `call` and next by using the keyoword `yield`. Thus, `"A block is called!"` is output twice.




#### 21, What concept does the following code demonstrate?

```ruby
def time_it
  time_before = Time.now
  yield
  time_after= Time.now
  puts "It took #{time_after - time_before} seconds."
end
```

**Answer:** 

The above code demonstrates a method that takes in a block an yields to it. It shows the concept of 'sandwich code', which is basically that the method performs some before and after action, in this case being recording the time before and after a block of code is executed and then outputs the time taken for execution. In such cases, during the method implementation, the before and after part are provided for. The block is provided when the method is called and can be anything as per the requirement of the method caller.

#### 22, What will be outputted from the method invocation `block_method('turtle')` below? Why does/doesn't it raise an error?

```ruby
def block_method(animal)
  yield(animal)
end

block_method('turtle') do |turtle, seal|
  puts "This is a #{turtle} and a #{seal}."
end
```

**Answer:**

In the above code, the method `block_method` is called and the string `'turtle'` is passed as an argument. Also, the block following it with two block paramaters `turtle` and `seal` is passed to the method. On invocation, the method parameter `animal` references the string `'turtle'`. Within the method, the block is called using the keyword `yield` and `animal` is passed as an argument to the block. Since, the block has two parameters, the passed argument is assigned to the first parameter `turtle` and `nil` gets assigned to the second block parameter `seal`. Within the block the method `puts` is called which outputs the string with string interpolation of the block parameters `turtle` and `seal`. Since, `seal` references `nil`, its interpolated to an empty string `''` hence the string `"This is a turtle and a ."` is output.

Here an error is not raises even though the number of arguments passed to the block is less than the number of the block parameters, because blocks in Ruby have what is called a lenient arity unlike methods. Because of which an error is not raised when the wrong number of arguments are passed.


#### 23, What will be outputted if we add the follow code to the code above? Why?

```ruby
block_method('turtle') { puts "This is a #{animal}."}
```

**Answer:**

The above code will raise an error `NameError`. Here, the block doesn't have a block parameter defined. Hence, when the string `"This is a #{animal}."` tries to interpolate the value of `animal`, the `NameError` will be raised as there is no method or variable named `animal` in the scope of the block.

#### 24, What will the method call `call_me` output? Why?

```ruby
def call_me(some_code)
  some_code.call
end

name = "Robert"
chunk_of_code = Proc.new {puts "hi #{name}"}
name = "Griffin"

call_me(chunk_of_code)
```

**Answer**

Here the `chunk_of_code` is initialized to a `Proc` object which references the local variable `name`. After this the value of `name` is reassigned from `"Robert"` to `"Griffin"`. 

Then the method `call_me` is called and the `Proc` object referenced by `chunk_of_code` is passed as an argument. On the method invocation, the method parameter references the `Proc` object. This is called using the method `call`. When the `Proc` is called the string `"hi Griffin"` is output. This is because the local variable `name` is in the binding of the `Proc` and the `Proc` is aware when the value of `name` is changed even after the definition of the `Proc`. Closures like `Proc`s retain the references to their surronding artifacts, this is called their binding. 

#### 25, What happens when we change the code as such:

```ruby
def call_me(some_code)
  some_code.call
end

chunk_of_code = Proc.new {puts "hi #{name}"}
name = "Griffin"

call_me(chunk_of_code)
```

**Answer:**

Unlike the previous answer, here an error will be raised `NameError`. This because the variable `name` is not initialized before the `Proc` is defined and hence cannot be referenced by the `Proc`.

#### 26, What will the method call `call_me` output? Why?

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

**Answer:** 

Here the output will be `"hi Robert"`. 

This is due to how Ruby resolves names. Ruby first tries to search for a local variable by a given name if it cannot find one it tries to find a method. Here, since the local variable `name` is defined and is a part of the binding of the `Proc` object the value `"Robert"` is interpolated. In, case we wanted to specifically reference the method `name`, this can be done by prepending `self` to the call to `name` within the `Proc`.




#### 27, Why does the following raise an error?

```ruby
def a_method(pro)
  pro.call
end

a = 'friend'
a_method(&a)
```

**Answer:**

The above code inializes a local variable `a` to the string `'friend'`. 

Then, the method `a_method` is called where the `&` is prepended to the name of the argument being `a`. What this does is tries to convert a Proc object to a block and pass it to the method. However, in this case the object referenced by `a` is not a Proc but a string and it cannot be convereted into a block, hence a `TypeError` is raised.




#### 28, Why does the following code raise an error?

```ruby
def some_method(block)
  block_given?
end

bl = { puts "hi" }

p some_method(bl)
```

**Answer:** 

The above code raises a syntax error. This is because blocks in Ruby are unnamed chunks of code and cannot be assigned to variables as is being done on line 5. 


#### 29, Why does the following code output `false`?

```ruby
def some_method(block)
  block_given?
end

bloc = proc { puts "hi" }

p some_method(bloc)
```

**Answer:**

The method `block_given?` returns `true` when a block is passed to a method and `false` otherwise. In this case, we are passing in a `Proc` to the method referenced by `bloc`. This `Proc` is assigned to the method parameter `block` and nothing is done with the `Proc` within the method. However, since a block is not passed to the method, `block_given?` returns `false`. This can be made `true` in several ways by converting the Proc to a block.

#### 30, How do we fix the following code so the output is `true`? Explain

```ruby
def some_method(block)
  block_given? # we want this to return `true`
end

bloc = proc { puts "hi" } # do not alter this code

p some_method(bloc)
```

**Answer:**

```ruby
def some_method
  block_given?
end

bloc = proc { puts "hi" }

p some_method(&bloc)      # => true
```

Here, the method parameter is removed and at the time of invocation of the method `&` is prepended to the argument which converts the Proc to a block and passes it to the method. Since, a block is passed, `block_given?` returns `true`.


#### 31, How does `Kernel#block_given?` work?

**Answer:**

The method `Kernel#block_given?` returns `true` when a block is passed in to a method and `false` otherwise. This is helpful specially when we are yielding to a block from within a method. We can use a conditional to check if a block is passed to the method and then yield to it, in case a block is not passed some other action can be taken, otherwise the `LocalJumpError` would be raised when trying to yield with no block passed in.

#### 32, Why do we get a `LocalJumpError` when executing the below code? &
How do we fix it so the output is `hi`? (2 possible ways)

```ruby
def some(block)
  yield
end

bloc = proc { p "hi" } # do not alter

some(bloc)
```

Here, a Proc object is assigned to the local variable `bloc`. Then the method `some` is called and `bloc` is passed as an argument.

After invocation, the method parameter references the `Proc` object referenced by `bloc`. Within the method the keyword `yield` is used to call the block passed to the passed. Since, no block is passed, the `LocalJumpError` is raised. This can be fixed in two ways as follows:

```ruby
# Way 1:
def some
  yield
end

bloc = proc { p "hi" } # do not alter

some(&bloc)

# Way 2:
def some(block)
  block.call
end

bloc = proc { p "hi" } # do not alter

some(bloc)
```

In way 1, we prepend the argument to `some` with `&`, which converts the `Proc` to a block and is passsed to the method. Also, since now no arguments are passed to the method, but a block is passed, the method parameter must be removed. Then within the method, the block is called using `yield` and `"hi"` is output.

In way2, the `Proc` is passed to the method as an argument and is assigned to the method parameter `block`. Within the method the `Proc` is called using the method `call` and `"hi"` is output.


#### 33, What does the following code tell us about lambda's? (probably not assessed on this but good to know)

```ruby
bloc = lambda { p "hi" }

bloc.class # => Proc
bloc.lambda? # => true

new_lam = Lambda.new { p "hi, lambda!" } # => NameError: uninitialized constant Lambda
```

**Answer:**

This tells us that lambdas are not a class in Ruby and are objects of the class `Proc`. When we try to instantiate a lambda with `Lambda.new` a `NameError` is raised since no such class exists.


### 34, What does the following code tell us about explicitly returning from proc's and lambda's? (once again probably not assessed on this, but good to know ;)

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

**Answer:** 

The above code demonstartes that that explicitly returning from a lambda simply exits the lambda however in the case of procs, explicitly returning, exits from the enclosing method as well and thus the last line of the method `proc_return` is not executed.


#### 35, What will `#p` output below? Why is this the case and what is this code demonstrating?

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

**Answer:**

The call `p` on the last line will return and output the array `['one', 'two' 'three']`.

Here, a method `retained_array` is defined which rerturns a `Proc` object. This `Proc` object retains the reference to the local variable `arr` which is initalized within the method and is a part of its binding.

A local variable `arr` is initialized to the return value of the method `retained_array`, hence `arr` references the `Proc` object returned by `retained_array`.

After which the method `call` on the object referenced by `arr` twice and the strings `'one'` and `'two'` are passed as arguments. This executes the `Proc` and passes the strings to the `Proc`. Within the `Proc` the argument is added to the array referenced by `arr` within the method `retained_array`. Outside of the method, the variable the `Proc` referenced by `arr` retains reference to the variable `arr` within the method and hence the subsequents arguments are added to that copy of the array.

Finally, in the last line, the method `call` is invoked on the `Proc` and the string `'three'` is passed as an argument. This adds the string to the array. The method `p` outputs and returns the return value of the `Proc` which is the array `['one', 'two', 'three']`.

The concept demonstrated here is that methods can return `Proc`s and that a `Proc` retains references to its surrounding artifacts which is called its binding.


# TESTING WITH MINITEST

#### 36, What is a test suite?

**Answer:**

A test suite is the entire set of tests that accompanies a program or application. This includes all the tests, assertions, setup, teardown etc.

#### 37, What is a test?

**Answer:**

A test describes a situation or context in which tests are run. For example, this test is about making sure that a method returns a particular string. A test can contain multiple assertions.

#### 38, What is an assertion?

**Answer:**

This is the actual verification step to confirm that the data returned by the program or application is indeed what is expected.

#### 39, What do testing framworks provide?

**Answer:**

#### 40, What are the differences of Minitest vs RSpec

**Answer:**

Minitest is Ruby's default testing library and is a part of Ruby's standard library. 

Rspec is Domain Specific Language, its a DSL for writing tests which allows developers write code that reads more like natural english at the cost of simplicity. 

Though Minitest can also use a DSL, it has the added advantage of being used in way that reads like ordinary Ruby code. This is just simply Ruby code.


#### 41, What is Domain Specific Language (DSL)?

**Answer:**

#### 42, What is the difference of assertion vs refutation methods?

**Answer:**

Assertions assert equality. For example, `assert_equal(50, value)` passes if the value referenced by `value` is `50`. The most basic method `assert` passes if the value passed to it is truthy.

Refutations on the other hand are the opposite. The method `refute` passes if the object passed to it is falsey. All other refutations take the same arguments like their corresponding assertions, except its doing a refutation. For example `refute_equal(50, value)` passes if the object referenced `value` is not `50`. 


#### 43, How does assert_equal compare its arguments?

**Answer:**

`assert_equal` compares it's arguments using the method `==`. The syntax is as follows:

```ruby
assert_equal(50, value)
```

The above method checks if the object referenced by `value` is equal to `50`. In other words it checks for `50 == value`. 


#### 44, What is the SEAT approach and what are its benefits?

**Answer:**

The SEAT apprach to testing consists of 4 steps:

`S`- setup the necessary objects
`E`- execute the code against the objects we are testing
`A`- assert the results of the execution
`T`- teardown and clean up the lingering artifacts

Using this approach, the setup and teardown steps are performed after every test. 

Teardown is mainly needed for cleaning up files, logging some information, closing database connections etc. 

These steps provide a holistic approach to writing tests. The setup step provideds ith the necessary objects for the tests so that objects are not defined separately for each test. The variables defined in the `setup` method must be instance variables as the tests are basically instance methods.




#### 45, When does setup and tear down happen when testing?

**Answer:**

The `setup` method will be called before running every test and the `teardown` method will be called after running every test. 


#### 46, What is code coverage?

**Answer:**

Code coverage gives an idea of how much of our program code is being tested by a test suite. Code coverage is based on testing of all of the code both public and private methods. 

Code coverage however doesn't imply that every edge case is considered or even that the program is running correctly. It only shows that we have tests in place for every method. Even though not foolproof, it is one way to gauge code quality.

A simple tool to get this is done is using the gem `simplecov`.


#### 47, What is regression testing?

**Answer:**

Regression testing is testing that changes being made in the code do not adversly effect the running of the program / application. It helps to make changes and see that those changes are not breaking any part of the program. 

# CORE TOOLS

48, What are the purposes of core tools?

49, What are RubyGems and why are they useful?

50, What are Version Managers and why are they useful?

51, What is Bundler and why is it useful?

52, What is Rake and why is it useful?

53, What constitues a Ruby project?