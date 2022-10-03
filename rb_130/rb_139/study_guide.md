# Study guide for RB139 Assessment

## Blocks

#### Closures, binding, and scope

### Closures:
- A closure is a general programming concept that allows a programmer to save a "chunk of code" and execute it at a later time.
- It's called a closure because it binds its surrounding artifacts (ie, names like variables and methods) and builds an enclosure around everything so that they can be referenced when the closure is later executed.
- It can also be though of as a method you can pass around and execute.

Ruby implements cloures through:
- instantiating an object from the `Proc` class
- using lambdas
- using blocks

It is different to just creating a method and calling that later. It can be passed into existing methods. It retains references to its surrounding artifacts - its **binding**.

### Scope




#### How blocks work, and when we want to use them.

### Blocks:
Blocks are defined by either `{ ... }` or `do ... end`.

Example:
```ruby
[1, 2, 3].each do |num|
  puts num
end
```

Here the `each` method is called on the `Array` object and the `do ... end` part which is the block is passed as an argument.


#### Blocks and variable scope

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


#### Write methods that use blocks and procs

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

### Yielding
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


#### Understand that methods and blocks can return chunks of code (closures)
#### Methods with an explicit block parameter
#### Arguments and return values with blocks
#### When can you pass a block to a method
#### &:symbol
#### Arity of blocks and methods


## Testing With Minitest

#### Testing terminology
#### Minitest vs. RSpec
#### SEAT approach
#### Assertions

## Core Tools/Packaging Code

#### Purpose of core tools
#### Gemfiles
