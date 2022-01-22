###Example 1

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
a = “Hello”
b = a
a = “Goodbye”
puts a
puts b
```
Answer :

The return value of the code is `nil`.
The output of `line 4` is `'Goodbye'` and the output of `line 5` is `'Hello'`.

On `line 1` local variable `a` is intialized to the string object with value `"Hello"`. On `line 2` local variable `b` is initialized to the string object variable `a` is referencing. Currently both of these local variables are pointing to the same string object.

On `line 3` local variable `a` is reassigned to another string object with value `'Goodbye'`. Now local variable `a` is pointing to a string object with value `'Goodbye'` and local variable `b` is pointing to another string object with value `'Hello'`.

On `line 4` we call the `puts` method and pass the local variable `a` as an argument which outputs the string object `'Goodbye'` which the local variable `a` points to and returns `nil`. 

On `line 5` we call the `puts` method and pass the local variable `b` as an argument which outputs the string object `'Hello'` which the local variable `b` points to and returns `nil`.


###Example 2

What does the following code return? What does it output? Why? What concept does it demonstrate?
```ruby
a = 4

loop do
  a = 5
  b = 3
  break
end

puts a
puts b

```

Answer :

The code returns an error - undefined local variable or method `b`.

The code outputs `5`

On `line 1` local variable `a` is initialized to the interger object `4`.

On `line 3` the `loop` method is invoked and the `do..end` block is passed to it as an argument. Within the block on `line 4` the local variable `a` is reassigned to an integer object with value `5`. On `line 5` a local variable `b` is initialized to an integer object `3`. On `line 6` we use `break` to break out of the `loop`

On `line 8` is we call the `puts` method and pass the local variable `a` as an argument which outputs the integer object `5` which the local variable is pointing to, and returns `nil`.

On `line 9` we call the `puts` method and pass `b` as an argument. This raises an error, undefined local variable or method since the the variable `b` is intialized within the block and is not available outside of it. However, since the local variable `a` was initialized on `line 1`, it is simply reassigned within the block on `line 4` and is available outside the block.

The concept of variable scope is demonstrated in this code. Local variables initialized in an inner scope can't be accessed in the outer scope, but local variables that are initialized in the outer scope can be accessed in an inner scope.

###Example 3

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
1   | a = 4
2   | b = 2
3   | 
4   | loop do
5   |   c = 3
6   |   a = c
7   |   break
8   | end
9   |
10  | puts a
11  | puts b

```
Answer :

The code outputs `3` and `2` and returns `nil`.

On `line 1` local variable `a` is initialized to an integer object with value `4` and on `line 2` local variable `b` is initialized to an integer object with value `2`. 

On `line 4` we invoke the `loop` method and pass the `do..end` block to it as an argument. Within this block we initialize a local variable `c` and then reassign `a` to point to the same object that `c` is referencing. Since the reassignment is within the inner scope defined by the block, local variable `c` is accessible.

On `line 10` we call the puts method and pass the local variable `a` as an argument. Since, local variable `a` now points to `3` after the reassignment within the block, `3` is output and `nil` is returned.

On `line 11` we call the puts method and pass the local variable `b` as an argument which outputs the object being referenced by `b` which `2` and returns `nil`.

The concept of variable scope is demonstrated in this example.


###Example 4
What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
1 | def example(str)
2 |   i = 3
3 |   loop do
4 |     puts str
5 |     i -= 1
6 |     break if i == 0
7 |   end
8 | end
9 |
10| example('hello')

```

Answer :

The code outputs `'hello'` three times and returns `nil`.

On `lines 1 - 8` a method named `example` is defined which takes 1 parameter.

On `line 10` the method is invoked and the string `'hello'` is passed as an argument. 

On `line 2` a local variable `i` is initialized to an integer object `3`. On `line 3` the `loop` method is called and the `do..end` block is passed as an argument. 

On `line 4` the method `puts` is called and the local variable `str` is passed as an argument.

On `line 5`, the local variable `i` is being reassigned. -= is reassigment and is Ruby's syntactical sugar for the expression `i = i - 1`. Infact `-` is also not an operator but a method and this code can be written as `i = i.-(1)`. This is reassigning the local variable `i` to the return value of the method call `Integer#-` on the local variable `i` with integer `1` passed to it as an argument.

`On line 6` we are breaking out of the loop if the value of the object that the local variable `i` is pointing is equal to `0`.

This code outputs `hello` 3 times and returns `nil`. Since, there is no explicit `return` inside the method, the last evaluated expression is returned. The last evaluated expression is `break if i == 0` which returns `nil`.


###Example 5

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
1 | def greetings(str)
2 |   puts str
3 |   puts "Goodbye"
4 | end
5 |
6 | word = "Hello"
7 |
8 | greetings(word)

```
The code outputs `'Hello'` and `'Goodbye'` in the same order and returns `nil`. 

`On lines 1 - 4` a method `greetings` is defined which takes 1 parameter.

`On line 6` a local variable `word` is intialized to a string object with value `'Hello'`. 

On `line 8` the method `greetings` is invoked and the local variable `word` is passed as an argument. 

Within the `greetings` method, on `line 2` the `puts` method is called and the local variable `str` is passed as an argument which points to the same object `'Hello'` that is being referenced by the argument `word` in the method call. On `line 3` the method `puts` is called and the string object `'Goodbye'` is passed as an argument.

This code outputs `'Hello'` and `'Goodbye'` and returns `nil`. The return value the method `greetings` is the last expression evaluated since it has not explicit `return`. The last evaluated expression is `puts "Goodbye"` which returns `nil`.

The code demonstrates the concept of local variable scope, method definition with a parameter as well as method invocation with an argument. 

###Example 6
What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
arr = [1, 2, 3, 4]
counter = 0
sum = 0

loop do
  sum += arr[counter]
  counter += 1
  break if counter == arr.size
end 

puts "Your total is #{sum}"

```
Answer :

The code outputs `Your total is 10` and returns `nil`. 

On `line 1` a local variable `arr` is initialized to an array with value `[1, 2, 3, 4]`. On `line 2` a local variable `counter` is initialized to an integer `0`. On `line 3` a local variable `sum` is initialized to an integer `0`. 

On `line 5` the `loop` method invoked and the `do..end` block is passed as an argument. Within the block the local variable `sum` is reassigned using the code `sum += arr[counter]` which is Ruby's syntactical sugar for `sum = sum + arr[counter]` which reassigns the variable `sum` to the sum of variable `sum` and `arr[counter]` that is the element in the array `arr` at index with the value being referenced by the variable `counter`. On `line 6` the local variable `counter` is reasiggned using the code `counter += 1` which is Ruby's syntactical sugar for `counter = counter + 1`. On `line 7` we are breaking out of the `loop` by using `break` if the value of the object referenced by `counter` is equal to the return value of the `size` method using `arr` as argument which returns the integer object representing the size of the array.

On `line 9` the the `puts` method is called and the following string is passed as an arguments which outputs `Your total is 10` and returns `nil`.

The code demonstrates the concept of variable scoping. A local variable defined outside a block can be accessed within the block whereas a local variable initialised within a block cannot be accessed outside of it.

###Example 7 
What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
a = 'Bob'

5.times do |x|
  a = 'Bill'
end

p a

```
The code outputs `'Bill'` and returns `'Bill'`.

On `line 1` local variable `a` is initialised to a string `'Bob'`.

On `line 3` the `times` method is called on integer `5` and the `do..end` block is passed as an argument with one parameter `x`. On `line 4` the local variable `a` is reassigned to the string `'Bill'`.

On line `line 7` the method `p` is called and local variable `a` is passed as an argument which outputs and returns the object being referenced by the local variable `a`. Since local variable `a` was reassigned to the string `'Bill'` within the block, the code outputs `'Bill'` and returns `'Bill'`.

The code demonstrates the concept of variable scoping. A local variable defined outside a block can be accessed within the block whereas a local variable initialised within a block cannot be accessed outside of it.

##Variable Shadowing

###Example 1

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
a = 4
b = 2

2.times do |a|
  a = 5
  puts a
end

puts a
puts b

```
Answer :

The code outputs `5`, `5`, `4`, `2` in this order and returns `nil`.

On `line 1` local variable is initialised to an integer `4`. On `line 2` local variable `b` is initialised to an integer `2`.

On `line 3` the `times` method is called on integer `2` and the `do..end` block is passed as an argument with one parameter `a`. Since the parameter `a` has the same name as the local variable `a` initialised outside the block, the concept of variable shadowing comes in place. On `line 5` local variable `a` is reassigned to the integer `5` and because of variable shadowing the local variable `a` passed in the `do..end` block as a parameter is being accessed and the local variable `a` initialized outside still points to the integer `4`. On `line 6` the `puts` method is called and local variable `a` which was passed in the `do..end` block as a parameter is passed as an argument which outputs `5` and returns `nil`.

On `line 8` the puts method is called local variable `a` is passed as an argument which outputs the `4` and returns `nil`. On `line 9` the `puts` method is called and local variable `b` is passed as an argument which outputs `2` and returns `nil`.

The code demonstrate the concept of variable shadowing. When the parameter has the same name as the local variable initialized outside the block, variable shadowing prevents access to the local variable of the same name intialized outside the block.

###Example 2
What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
n = 10

1.times do |n|
  n = 11
end

puts n

```

Answer : 

The code outputs `10` and returns `nil`.

This code demonstrates the concept of variable shadowing. On `line 1` local variable `n` is initialised to the integer `10`. 

On `line 3` the `times` method is called on the integer `1` and the `do..end` block is passed as an argument with one parameter `n`. Since, the name of the parameter is the same as the name of the local variable `n` initialised outside the block, the consequence of variable shadowing is that prevents access to the local variable with the same name initialised outside the block. As a result, on `line 4` local variable `n` is reassigned to integer `11`, here the local variable `n` is the parameter passed in the `do..end` block.

On `line 7` the `puts` method is called and local variable `n` is passed as an argument. Because of the consequence of variable shadowing, the local variable `n` defined outside the `do..end` block points to the integer `10`. This outputs `11` and returns `nil`.

###Example 3

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
animal = "dog"

loop do |animal|
  animal = "cat"
  break
end

puts animal

```

The code outputs `'dog'` and returns `nil`.

On `line 1` local variable `animal` is initialised to the string `'dog'`. 

On `line 3` the `loop` method is invoked and the `do..end` block is passed as an argument with on parameter `animal`. Since, the name of the parameter is the same as the name of the local variable initialised outside the block, the access to the local variable initialised outside the block is prevented within the block. On `line 4` the local variable `animal` is assigned to the string `'cat'`.  The local variable `animal` passed in the `do..end` block as a parameter is accessed. On `line 5`, `break` is used to break out of the loop.

On `line 8` the puts method is called and the local variable `animal` is passed as an argument. Because of variable shadowing, the local variable `animal` initialised outside the block points to the string `'dog'`. This outputs `'dog'` and returns `nil`.

The concept of variable shadowing is demonstrated here.

##Object passing / variables as pointers

###Example 1

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
a = "hi there"
b = a
a = "not here"

```

What are a and b?

Answer :

On `line 1` local variable `a` is intialised to the string `'hi there'`. On `line 2` local variable `b` is initialised to the string object being referenced by local variable `a`. On `line 3` local variable `a` is reassigned to the string `'not here'` as a result the local variable `a` and local variable `b` point to different objects.

As a result local variable `a` points to the string `'not here'` and local variable `b` points to the string `'hi there'`.

###Example 2

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby 
a = "hi there"
b = a
a << ", Bob"

```

What are a and b?

Answer :

On `line 1` local variable `a` is initialised to the string `'hi there'`. On `line 2` local variable `b` is initialised to point to the string object being referenced by the local variable `a`. On `line 3`, `<<` method is called on the local variable `a` and the string `', Bob'` is passed as an argument. As a result the string object `'hi there'` is concatenated with the string `', Bob'` and is modified destructively or mutated. Now, both the local variables `a` and `b` point to the same string object `'hi there, Bob'`.


###Example 3

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
a = [1, 2, 3, 3]
b = a
c = a.uniq

```

What are a, b, and c? What if the last line was `c = a.uniq!`?

Answer : 

On `line 1` local variable `a` is initialized to an array `[1, 2, 3, 3]`. On `line 2` local variable `b` is initialised to point to the array being referenced by local variable `a`. On `line 3` local variable `c` is intialised to the return value of the method `uniq` being called on the local variable `a`, which is the array object `[1, 2, 3].

As a result local variable `a` and `b` point to the array `[1, 2, 3, 3]`. Local variable `c` points to the array `[1, 2, 3]`.

If the last line was `c = a.uniq!`, the local variable `c` is initialised to the return value of the method `uniq!` called on the local variable `a` which is the array `[1, 2, 3]`. The method `'uniq!'` mutates the caller and as a result the object being referenced by local variables `a` and `b` is modified to the array `[1, 2, 3]`. As a result the local varaibles `a`, `b` and `c` point to the array `[1, 2, 3]`.


###Example 4

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
def test(b)
  b.map {|letter| "I like the letter: #{letter}"}
end

a = ['a', 'b', 'c']
test(a)

```

What is `a`? What if we called `map!` instead of `map`?

Answer : 

On `lines 1 - 3` a method `test` is defined with one parameter `b`. 

On `line 5` a local variable `a` is initialised to the array `['a', 'b', 'c']`. On `line 6` the method `test` is invoked and local variable `a` is passed as an argument. Now, the method parameter `b` references the object being referenced by local variable `a`. On `line 2` the method `map` is called on the local variable `b` and the block is passed as an argument with one parameter `letter`. The `map` method returns an array of elements which represent the return the return value of the block passed to it. In this case the array `['I like the letter: a', 'I like the letter: b', 'I like the letter: c']` returned and since this is the last line of the method `test` this is what is the return value of the method. 

As a result the local variable `a` points to the array `['a', 'b', 'c']`. 

If the method `map!` was called, this would mutate the caller. Since, the local variable `b` within the method definition points to the object being referenced by local variable `a` the method call would modify the array object being passed to it. As a result the array object being referenced by the local variable `a` would be modified to the value `['I like the letter: a', 'I like the letter: b', 'I like the letter: c']`. 

## Example 5

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
a = 5.2
b = 7.3

a = b

b += 1.1
```
What is `a` and `b`? Why? 

Answer :

On `line 1` local variable `a` is initialized to float object with value 5.2. On `line 2` local variable `b` is initialized to float object with value 7.3. 

On `line 3` local variable `a` is reassigned to point to the object local variable `b` is referencing. Now, local variables `a` and `b` point to the same float object with value 7.3.

On `line 5`, `b` is reassigned using `b += 1.1` which is Ruby's syntactical sugar for the code `b = b + 1.1`. Here the local variable `b` is reassigned to the return value of the method `+` being called on `b` with `1.1` as the argument. After this reassignment local variable `b` points to a float object with value 8.4 and local variable `a` continues to point to the float object with value 7.3.


## Example 6 

What does the following code return? What does it output? Why? What concept does it demonstrate?
```ruby
def test(str)
  str  += '!'
  str.downcase!
end

test_str = 'Written Assessment'
test(test_str)

puts test_str
```

The code outputs `"Written Assessment"` and returns `nil`.

On `lines 1 - 4` a method named `test` is being defined with one parameter `str`.

On `line 6` local variable `test_str` is initialized to the string object `'Written Assessment'`. 

On `line 7` the method `test` is being invoked and the local variable `test_str` is passed as an argument. The method parameter `str` now points to the object being referenced by `test_str` and is available for use inside the method definition as a local variable. Inside the method definition on `line 2` the local variable `str` is reassigned using `str += '!'` which is Ruby's syntactical sugar for the `str = str + '!'`. After this reassignment local variable `str` now points to a new string with value `Written Assessment!` and local variable `test_str` outside the method definition continues to point to the string object `'Written Assessment`. On `line 3` the method `downcase!` is called on the local variable `str` which is a destructive method and changes the string that `str` references to `'written assessment!`. Since, this is the last line of the method, the method returns a new string object with value `'written assessment!'`. 

On `line 9` the methods `puts` is invoked and local variable `test_str` is passed as an argument. Since the local variable `test_str` continues to point to the string `'Written Assessment'` that is what is output and `nil` is returned.

The concept of varibles as pointers is being demonstrated here in the sense that variables in Ruby act as pointers to objects. 

## Example 7

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
def plus(x, y)
  x = x + y
end

a = 3
b = plus(a, 2)

puts a
puts b

```

On `lines 1 - 3` a method `plus` is defined with 2 parameters `x` and `y`. 

On `line 5` local variable `a` is initialized to an integer with value `3`. On `line 6` local variable `b` is initialized to the return value of the invocation of method `plus` with local variable `a` and integer `2` as arguments. The method parameters `x` and `y` now reference the object referenced by local variable `a` and integer `2` respectively and are available for use inside the method definition as local variables in that scope. 

On `line 2` local variable x is being reassigned using `x = x + y` and after this reassignment `x` now points to a different integer with the return value of method `+` being called on `x` with `y` as an argument. After this reassigment `x` points to an intger with value `5`. Since, this is the last line of the method, an integer `5` is returned. 

So now, local variable `b` points to integer `5`.

On `lines 8 and 9` the method is `puts` is being called and the local variables `a` and `b` respectively are passed as arguments. This outputs the object being refernced by the respetive variables in the order - `3`, `5` and returns `nil`.

The concept of variables as pointers is being demonstrated here.

## Example 8

What does the following code return? What does it output? Why? What concept does it demonstrate?
```ruby
def increment(x)
  x << 'b'
end

y = 'a'
increment(y) 

puts y
```
The above code returns `nil` and outputs `'ab'`.

On `lines 1 - 3` a method `increment` is being defined with one parameter `x`. 

On `line 5` local variable `y` is initialized to the string object `'a'`. On `line 6` the method `increment` is being invoked and `y` is passed as an argument. After the method invocation local variable `x` within the method definition points to the string object being referenced by local variable `y`. Within the method on `line 2` the method `<<` is being invoked. This is a destructive method and modifies the string being referenced by the local variable `x`. The string that local variable `x` points is now changed to the value `ab`. 

On `line 8` the method `puts` is being called and local variable `y` is passed as an argument. The string object referenced by local variable `y` has the value `'ab'` so that is what is output and `nil` is returned.

The concept of variables as pointers is being demonstarted here.




