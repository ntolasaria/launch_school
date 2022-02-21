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

## Example 9

What does the following code return? What does it output? Why? What concept does it demonstrate?
```ruby
def change_name(name)
  name = 'bob'      # does this reassignment change the object outside the method?
end

name = 'jim'
change_name(name)
puts name 
```

Answer :

The above code outputs `"jim"` and returns `nil`. 

On `lines 1 - 4` a method `change_name` is defined with one parameter `name`.

On `line 6` local variable `name` is initialized to string object `'jim'`. On `line 7` the method `change_name` is invoked and the local variable is `name` is passed as argument. After the invocation the method parameter `name` references the string object that local variable `name` in the main scope is pointing to and is available to use within the method definition as a local variable within the scope of the method definition.

On `line 2` local variable `name` is reassigned to point to the string object `'bob'`. After this reasignmnent the local variable `name` within the method the definition points to the string object `'bob'` whereas the local variable `name` outside the method definition continues to point to the string object `'jim'`. 

On `line 8` the `puts` method is invoked and the local variable `name` is passed as an argument. This outputs the string object that local variable `name` is pointing to and returns `nil`. So in this case, `'jim'` is output and `nil` is returned.

The concept of variables as pointers is demonstrated in this example.

## Example 10

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
def cap(str)
  str.capitalize!   # does this affect the object outside the method?
end

name = "jim"
cap(name)
puts name 
```

The above code outputs `'Jim'` and returns `nil`. 

On `lines 1 - 3` a method `cap` is defined with one parameter `str`. 

On `line 5` local variable `name` is initialized to string object `'jim'`. On `line 6` the method `cap` is invoked and local variable `name` is passed as an argument. 

After the method invocation, the method parameter `str` points to the string object being referenced by the local variable `name`. On `line 2` the method `capitalize!` is called on the local variable `str` which is a destructive method. It mutates the string that the local variable `str` points to, in this case the string that is being referenced by local variable `name` as well. The effect of this is that the string object being referenced by both `str` and `name` is modified to `'Jim'`. Since, this is the last line of the method `cap`, the string `'Jim'` is returned.

On `line 7` the method `puts` is called and local variable `name` is passed as an argument. Since, the value of the string object being referenced by local variable `name` is now `'Jim'`, that is what is output and `nil` is returned.

The concept of variable as pointers is demonstarted in this problem.

## Example 11

What is `arr`? Why? What concept does it demonstrate?
```ruby
a = [1, 3]
b = [2]
arr = [a, b]
arr

a[1] = 5
arr
```

In the above code, the local variable `arr` points to an array object with value `[[1, 5], [2]]`.

On `line 1`, local variable `a` is initialized to an array of integers `[1, 3]`. On `line 2` local variable `b` is initialized to an array of integer `[2]`. On `line 3` local variable `arr` is initialized to an array object with local variables `a` and `b` as elements. So the array object that the local variable `arr` points to now has the value of `[[1, 3], [2]]` which is an array made up of the arrays that local variables `a` and `b` point to.

On `line 6` the method `[]=` is invoked using `a[1] = 5`. Here the integer at index `1` of the array being referenced by `a` is reasignned and the array object that `a` points to is changed to `[1, 5]` since this is a destructive method. 

Now, the local variable `arr` points to a an array made up of the local variables `a` and `b`, and since the array that local variable `a` has been chaneged, the array that the local variable `arr` is also changed to `[[1, 5], [2]]`.

The concept of variables as pointers is demonstrated in this example.

## Example 12
[Link to example](https://launchschool.com/lessons/c53f2250/assignments/1a6a2665)

```ruby
arr1 = ["a", "b", "c"]
arr2 = arr1.dup
arr2.map! do |char|
  char.upcase
end

puts arr1 
puts arr2
```

On `line 1` local variable `arr1` is initialized to an array of strings with value `["a", "b", "c"]`.

On `line 2` local variable `arr2` is initialized to the return value of the method `dup` invoked with `arr1` as argument. The return value of which is a new array object being refernced with the same value as the array object being referenced by `arr1`.

On `line 3` the methood `map!` is called on `arr2` and the `do..end` block is passed as an argument with one parameter `char`. Within the block the the method `upcase` is called on the local variable `char`. Since,this is the last line executed within the block, the return value of this line is the return value of the block. On every iteration, the respective element of the array being referenced by `arr2` is passed in the block and the return value of the block is the upcased value of the string object. Since `map!` is a destructive method, and returns an array with the elements being the return value of the block for each element, the array that `arr2` points to, now has the value `["A", "B", "C"]`. 

On `line 5` the method `puts` is called and local variable `arr1` is passed as an argument. This outputs the elements of the array object being referenced by `arr1` which is `["a", "b", "c"]` and returns `nil`. On `line 6` the `puts` method is called and local variable `arr2` is passed as an argument. This outputs the elements of the array being referenced by `arr2` which is `["A", "B", "C"]` and returns `nil`.

The concept of variables as pointers is being demonstrated here.

## Object Mutability/Mutating Methods

## Example 1

What does the following code return? What does it output? Why? What concept does it demonstrate? 
```ruby
def fix(value)
  value.upcase!
  value.concat('!')
  value
end

s = 'hello'
t = fix(s)
```
What values do `s` and `t` have? Why?

Answer :

The local variables `s` and `t` both point to a string object with value `'HELLO!'`.

On `lines 1 to 4` a method `fix` is defined with one parameter `value`.

On `line 6` local varaiable `s` is initialized to a string object `'hello'`. On `line 7` a local variable `t` is initialized to the return value of the method `fix` being called with local variable `s` as the argument. After the method invocation the method parameter `value` points to the string object being referenced by local variable `s` and is available within the method definition as a local variable. On `line 2` within the mehtod definition the method `upcase!` is called on the local variable `value`. Since, this is a destructive method the value of the string object referenced by the local variable `value` is now changed to `'HELLO'` which is also the string object being refernced by the local variable `s` outside the scope of the method definition. On `line 3` the method `concat` is called on the string object being referenced by `value` and the string `'!'` is passed as an argument. Being a destructive method, the string being referenced by local variable `value` as well as local variable `s` outside the method definition is now changed to `'HELLO!'`. On `line 4` the string object being referenced by the local variable `value` is returned and that is the return value of the method `fix`.

So, now after `line 6` local variables `t` and `s` point to the same same string object value `'HELLO!'`.

## Example 2

What does the following code return? What does it output? Why? What concept does it demonstrate?
```ruby
def fix(value)
  value = value.upcase
  value.concat('!')
end

s = 'hello'
t = fix(s)
```

What values do `s` and `t` have? Why?

Answer :

The local variable `s` points to string object with value `hello` and local variable `t` points to string object with value `HELLO!`.

On `lines 1 - 4` a method `fix` is defined with one parameter `value`. 

On `line 6` local variable `s` is initialized to string object `'hello'`. On `line 7` local variable `t` is initialized to the return value of the method `fix` being called with local variable `s` as the argument. 

After the method invocation the method parameter `value` points to the string object being referenced by the local variable `s` and is available within the method definition as a local variable. Within the method definition on `line 2` the local variable `value` is reasignned to the return value of the mehthod call `upcase` with local variable `value` as the argument. The return value of which is a new string with value `'HELLO'`. After this reassignment, the local variable `value` points a string object `'HELLO'` whereas the local variable `s` outside the mthod definition continues to point to the string object `'hello'`. On `line 3` the method `concat` is called on the string referenced by `value` and string `'!'` is passed as an argument. Since, this a destructive method, the value of the string object referenced by local variable `value` is modified to `HELLO!` and since this is the last line of the method, this is the return value of the method. 

So, now local variable `t` references a string object with value `'HELLO!'` and local variable `s` references a string object with value `'hello'`.

The concept of variables as pointers and object mutabiliy is demonstrated here. 

## Example 3
What does the following code return? What does it output? Why? What concept does it demonstrate?
```ruby
def fix(value)
  value << 'xyz'
  value = value.upcase
  value.concat('!')
end

s = 'hello'
t = fix(s)
```

What values do `s` and `t` have? Why?

Answer :

The local variables `s` and `t` point to string objects `"helloxyz"` and `"HELLOXYZ!"` respectively.

On `lines 1 - 5` a method `fix` is defined with one parameter `value`.

On `line 7` local variable `s` is initialized to a string object `"hello"`. On `line 8` local variable `t` is initialized to the return value of the method call `fix` with local variable `s` passed as an agrument. 

After the method invocation, the method parameter `value` points to to the string object being referenced by local variable `s` and is available for use within the method definition as a local variable in that scope. On `line 2` the method `#<<` is called and `value` is passed as an argument. `#<<` being a destructive method, modifies the string being referenced by `value` to `"helloxyz"` which is also the string that local variable `s` in the main scope points to. On `line 3` the local variable `value` is reassigned to the return value of the method `upcase` call with local variable `value` as the argument. After this reasignmemnt, local variable `value` now points to a new string object `"HELLOXYZ"`. On `line 4` the method `concat` is called on the string being referenced by local variable `value` and the string `"!"` is passed as an argument. The `concat` method is a destructive method which modifies the string that local variable `value` references. The string that local variable `value` references now has the value `"HELLOXYZ!"`. Since this is the last line of the method, the string object `"HELLOXYZ!"` is returned.

Now, local variable `s` points to string object `"helloxyz"` and local variable `t` points to string object `"HELLOXYZ!"`.

##  Example 4

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
def fix(value)
  value = value.upcase!
  value.concat('!')
end

s = 'hello'
t = fix(s)
```

What values do `s` and `t` have? Why?

Answer :

The local variables `s` and `t` point a string object with value `"HELLO!"`. 

On `lines 1 - 4` a method `fix` is defined with one parameter `value`. 

On `line 6` local variable `s` is initialized to a string object `'hello'`. On `line 7` local variable `t` is initialized to the return value of the method `fix` called with local variable `s` as the argument. 

After the method invocation, the method parameter `value` points to the string objecy being referenced by the local variable and `s` and is available for use within the method definition as a local variable in that scope. On `line 2` the local variable `value` is reassigned to the the return value of the of the method `upcase!` with local variable `value` as the parameter. The method `upcase!` is a destructive method and modifies the string that the local variable `value` points to. The result is that the modified string with value `'HELLO'` is returned and local variable `value` as well local variable `s` in the main scope continue to point to it. On `line 3` the method `concat` is called on the string being referenced by `value` and the string `'!'` is passed as an argument. `concat` being a destructive method modifies the string being referenced by the local variable `value` to `'HELLO!'` and since this is the last line of the method this the what is returned. 

Now, since the string returned by the method `fix` was the string being referenced by local variable `s`, the local variables `s` and `t` both point to the string `'HELLO!'`.

## Example 5

What does the following code return? What does it output? Why? What concept does it demonstrate?
```ruby
def fix(value)
 value[1] = 'x'
 value 
end

s = 'abc'
t = fix(s)
```

What values do `s` and `t` have? Why?

Answer :

The local variable `s` and `t` both point to a string object with value `'axc'`. 

On `lines 1 - 4` a method `fix` is defined with one parameter `value`.

On `line 6` local variable `s` is initialized to a string object `'abc'`. On `line 7` local variable `t` is initialized to the return value of the method `fix` with local variable `s` as as the argument.

After the method call, the method parameter `value` points to the string object being referenced by local variable `s` and is available for use within the method definition as a local variable within that scope. On `line 2` the `#[]=` is called using `value[1] = 'x'`, this method reassgins the element in the index `1` of the string and thereby modifies the existing string to the value `'axc'`. Now, the local variable `value` in the scope of the method definition as well as the local variable `s` in the main scope point to the string object with value `'axc'`. On `line 3` the string being referenced by local variable `value` is returned.

The local variables `s` and `t` point to the same string object with value `'axc'`.

## Example 6
What does the following code return? What does it output? Why? What concept does it demonstrate?
```ruby
def a_method(string)
  string << ' world'
end

a = 'hello'
a_method(a)

p a
```
Answer :

The code outputs `'hello world'` and returns `'hello world'`.

On `lines 1 - 3` a method named `a_method` is defined with one parameter `string`. 

On `line 5` local variable `a` is initialized to a string object `'hello'`. On `line 6` the method `a_method` is invoked and local variable `a` is passed as an argument. The method parameter `string` now points to the string beinf referenced by local variable `a` and is available for use within the method definition as a local variable in that scope. 

On `line 2` the method `#<<` is called on the string being referenced by the local variable `string` and the string `' world'` is passed as an argument. The `#<<` method is a destructive method which modifies the string being referenced by the local variable `string` to `'hello world'` and since this is the last line of the method this is what is rerturned. The string being referenced by local variable `string` is the same string which is being referenced by local variable `a` in the main scope. 

On `line 8` the method `p` is called and local variable `a` is passed as an argument. The `p` method outputs the string object being refernced by the local variable `a` which is the string `'hello world'` and returns the string object `'hello world'`.

The concept of object mutability is being demonstrated here.

## Example 7

What does the following code return? What does it output? Why? What concept does it demonstrate?
```ruby
num = 3

num = 2 * num
```

Answer :

The concept of variable as pointers is being demonstrated here.

On `line 1` local variable `num` is initialized to an interger with value `3`. On `line 3` local variable `num` is reassigned using `num = 2 * num`. Here the method `*` is called on the integer `2` and local variable `num` is passed as an argument. The return value of the method call is assigned to the local variable `num`. The return value is integer `6` and local variable `num` now points to integer `6`.

## Example 8
What does the following code return? What does it output? Why? What concept does it demonstrate?
```ruby
a = %w(a b c)
a[1] = '-'
p a
```

Answer :

The code outputs `["a", "_", "c"]` and returns `["a", "_", "c"]`.

On `line 1` local variable `a` is initialized to array of strings `['a', 'b', 'c']`. 

On `line 2` the method `#[]=` is called on the array referenced by the local variable `a` using `a[1] = '_'`. This reasigns the elements at index `1` of the array and modifies the array to `['a', '_', 'c']`. On `line 3` the method `p` is called and local variable `a` is passed as an argument which outputs the array `['a', '_', 'c']` and returns the same array.

## Example 9
[Link to page with #9 & #10](https://launchschool.com/lessons/a0f3cd44/assignments/4b1ad598)
```ruby
def add_name(arr, name)
  arr = arr + [name]
end

names = ['bob', 'kim']
add_name(names, 'jim')
puts names
```

Answer :

On `lines 1 - 3` a method named `add_name` is defined with two parameters `arr` and `name`.

On `line 5` local variable `names` is initialized to an array of string elements with value `['bob', 'kim']`. On `line 6` the method `add_name` is invoked and local variable `names` and string `'jim'` are passed as arguments. 

After the method invocation the method parameters `arr` and `name` point to the array being referenced by the local variable `names` and the string object `'jim'` respectively and are available for use within the method definition as local variables in that scope. On `line 2` the local variable `arr` is reassigned using `arr = arr + [name]` after which the local variable `arr` points to a new array which is returned by the expression `arr + [name]` which is `['bob', 'kim', 'jim']` whereas the local variable `names` continues to point to the array `['bob', 'kim']`. 

On `line 7` the method `puts` is invoked and local variable `names` is passed as an argument. This outputs the elements of the array being referenced by the local variable `names` which is `['bob', 'kim']` and returns `nil`.

## Example 10
```ruby
def add_name(arr, name)
  arr = arr << name
end

names = ['bob', 'kim']
add_name(names, 'jim')
puts names
```

Answer :

On `lines 1 to 3` a method named `add_name` is defined with two parameters `arr` and `name`. 

On `line 5` local variable `names` is initialized to an array `['bob', 'kim']`. On `line 6` the method `add_name` is invoked and the local variable `names` and string object `jim` are passed as arguments.

After the method invocation, the method parameters `arr` and `name` point to the array being referenced by local variable `names` and the string object `jim` respectively and are available as local variables within the method definition. On `line 2` the local variable `arr` is reassigned using `arr = arr << name`. Here local variable `arr` is reassigned to the return value of the method call `#<<` which is a destructive method. This modifies the array being referenced by the local variable `arr` to `['bob', 'kim', 'jim']` and returns the modified array. Thus, the array being referened by the local variable `names` in the main scope is also modified. 

On `line 7` method `puts` is invoked and local variable `names` is passed as an argument. This outputs the elements of the array being referenced by the local variable `names` being `['bob', 'kim', 'jim']` and returns `nil`.

## Each, Map and Select

## Example 1
What does the following code return? What does it output? Why? What concept does it 	demonstrate?
```ruby
array = [1, 2, 3, 4, 5]

array.select do |num|
   puts num if num.odd?
end
```

Answer :

The code outputs `1`, `3`, `5` and returns an empty array `[]`.

On `line 1` a local variable `array` is initialized to an array with integer elements `[1, 2, 3, 4, 5]`. 

On `line 3` the `select` method is called on the array being referenced by the local variable `array` and the `do..end` block with one parameter `n` is passed as an argument. The `select` method returns a new collection based on the truthiness of the block. If the return value of the block on any iteration is anything other than `false` or `nil` then the element in that iteration is selected and placed in the new collection. In this case the block executes `puts num` whenver the return value of the of the method call `odd?` on the local variable returns true, that is for every odd element. Hence, the elements `1`, `3` and `5` are output. However, the `select` method returns a new collection based on the truthiness of the block. For the iterations where `puts num` is executed, `nil` is returned and also for the rest of the iterations since none of the if statements are executed the return value `nil`. Since, the block returns `nil` for every iteration. An empty array is returned.

## Example 2
What does the following code return? What does it output? Why? What concept does it demonstrate?
```ruby
arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

arr.select { |n| n.odd? }
```

Answer :

The code returns an array `[1, 3, 5, 7, 9]`.

On `line 1` local variable `arr` is initialized to an array of integers from 1 to 10.

On `line 3` the `select` method is called on the array being referenced by the local variable `arr` and the block within `{..}` with one parameter `n` is passed as an argument. The `select` method returns a new collection based on the truthiness of the block. For every iteration, if the return value of the block is anything apart from `false` or `nil` the element of that iteration is selected and placed in a new collection. Here the code within the block `n.odd?` returns `true` for every odd element and `false` every even element. Thus, the `select` method here returns a new array `[1, 3, 5, 7, 9]`.

## Example 3
What does the following code return? What does it output? Why? What concept does it demonstrate?
```ruby
arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

new_array = arr.select do |n| 
  n + 1
end
p new_array
```

Answer :

The code returns outputs an array `[1, 2, 3, 4, 5, 6, 7, 8, 9, 10]` and returns the same array.

On `line 1` local variable `arr` is initialized to an array of integers 1 to 10. 

On `line 3` local variable `new_array` is initialized to the return value of the method `select` being called on the array being referenced by `arr` with the `do..end` block with one parameter `n` passed as argument. The `select` method returns a new collection based on the truthiness of the block. For every iteration, if the return value of the block is anything apart from `false` or `nil` the element in that iteration is selected and placed in a new collection. Here the code within the block `n + 1` returns an integer for every iteration and thus all the elements are selected and placed in a new collection. 

So, now local variable `new_array` points to the array returned by the `select` method being `[1, 2, 3, 4, 5, 6, 7, 8, 9, 10]`. 

On `line 6` the method `p` is called and the local variable `new_array` is passed as argument. This outputs and returns the array being referenced by the local variable `new_array` which is `[1, 2, 3, 4, 5, 6, 7, 8, 9, 10]`.  

## Example 4
What does the following code return? What does it output? Why? What concept does it demonstrate?
```ruby
arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

new_array = arr.select do |n| 
  n + 1
  puts n
end
p new_array
```

Answer :

The code outputs and returns an empty array `[]`.

On `line 1` local variable `arr` is initialized to an array of integers from 1 to 10. 

On `line 3` local variable `new_array` is initialized to the return value of the method `select` called on the array being referenced by local variable `arr` with the `do..end` block with one parameter `n` passed as argument. The `select` method returns a new collection based on the truthiness of the block. For every iteration, if the return value of the block is anything apart from `false` or `nil` the element for that iteration is selected and placed in a new collection. Here, the return value of the block is determined by the last line of the block which is `puts n`. Since the `puts` method always returns `nil` the return value of the block is `nil` for every iteration and thus none of the elements are selected and an empty array is returned which is being referenced by local variable new_array.

On `line 7` the method `p` is called and the local variable `new_array` is passed as argument which outputs and returns the object being referenced by the local variable `new_array` which is an empty array `[]`.

## Example 5

What does the following code return? What does it output? Why? What concept does it demonstrate?
```ruby
words = %w(jump trip laugh run talk)

new_array = words.map do |word|
  word.start_with?("t")
end

p new_array
```

Answer :

The code outputs and returns the array `[false, true, false, false, true]`. 

On `line 1` local variable `words` is initialized to an array of strings `['jump', 'trip', 'laugh', 'run', 'talk']`. 

On `line 3` local variable `new_array` is initialized to the return value of the method `map` called on the array being referenced by the local variable `words` with the `do..end` block passed as an argument with one parameter `word`. The method `map` returns a new collection with the return value of the block for every iteration as the elements. Within the block the local variable `word` references the element of the array for each iteration. Within the block the method `start_with?` is called on the object referenced by the local variable `word` and string `'t'` is passed as argument. The method calls returns `true` if the respective string objects starts with "t", otherwise it returns `false`. Here the block returns `true` for elements at index `1` and `4` and `false` for all other elements. The new array returned by the method is an array of booleans `[false, true, false, false, true]` which the local variable `new_array` now points to.

On `line 7` the method `p` is invoked and the local variable `new_array` is passed as an argument. This outputs and returns the array being referenced by the local variable `new_array` which is `[false, true, false, false, true]`.

## Example 6
What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

arr.each { |n| puts n }
```

Answer : 

The code outputs `1`, `2`, `3`, `4`, `5`, `6`, `7`, `8`, `9`, `10` in the same order and returns the array `[1, 2, 3, 4, 5, 6, 7, 8, 9, 10]`.

On `line 1` local variable `arr` is initialized to an array of integers `[1, 2, 3, 4, 5, 6, 7, 8, 9, 10]`. 

On `line 3` the `each` method is invoked on the array being refernced by the local variable `arr` and the block after that is passed as argument with one paramenter `n`. The block parameter `n` points to the corresponding element of the array for each iteration and is available inside the block as a local variable. With the `each` method the code within the block is executed for every iteration and the array that the method is called on is returned. Here the code in the block `puts n` outputs every element of the array once. The `each` method itself returns the array it was called on which is `[1, 2, 3, 4, 5, 6, 7, 8, 9, 10]`.

## Example 7
What does the following code return? What does it output? Why? What concept does it demonstrate?
```ruby
arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

incremented = arr.map do |n| 
            n + 1
            end
p incremented
```

Answer :

The above code outputs and returns the array `[2, 3, 4, 5, 6, 7, 8, 9, 10, 11]`.

On `line 1` local variable `arr` is initialized to an array of integers `[1, 2, 3, 4, 5, 6, 7, 8, 9, 10]`. On `line 3` local variable `incremented` is initialized to the return value of the `map` method called on the array being referenced by local variable `arr` with the following `do..end` block with one parameter `n` passed as argument. The `map` method returns a new collection made up of the return value of the block as elements for every iteration. Here, within the block, the last line `n + 1` returns the value of each elemenet incremented by `1` and thus the new array returned is made up of all the elements of the array it is being called on incremented by `1`. Hence, the array returned is `[2, 3, 4, 5, 6, 7, 8, 9, 10, 11]` and is now being referenced by the local variable `incremented`.

On `line 6` the method `p` is called and local variable `incremented` is passed as an argument. This outputs and returns the array being referenced by the local variable `incremented` which is `[2, 3, 4, 5, 6, 7, 8, 9, 10, 11]`.

## Example 8
What does the following code return? What does it output? Why? What concept does it demonstrate?
```ruby
arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

new_array = arr.map do |n| 
  n > 1
end
p new_array
```

The code outputs and returns an array `[false, true, true, true, true, true, true, true, true, true]`.

On `line 1` local variable `arr` is initialized to an array with integer elements `[1, 2, 3, 4, 5, 6, 7, 8, 9, 10]`. 

On `line 3` local variable `new_array` is initialized to the return value of the method `map` called on the array being referenced by the local variable `arr` and the `do..end` block with one parameter `n` is passed as argument. The `map` method returns a new collection with the return value of the block for every iteration as the elements. Here the code within the block `n > 1` returns either the `true` or `false` based on the corresponding element meeting the condition on every iteration. In this case the block returns `false` for the first element which `1` and `true` for all other elements as they are all greater than `1`. Hence, the `map` method returns the array `[false, true, true, true, true, true, true, true, true, true]` and this array is now being refernced by local variable `new_array`.

On `line 6` the method `p` is called and local variable `new_array` is passed as argument. This outputs and returns the array being referenced local variable `new_array` which is `[false, true, true, true, true, true, true, true, true, true]`.

## Example 9
What does the following code return? What does it output? Why? What concept does it demonstrate?
```ruby
arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

new_array = arr.map do |n| 
  n > 1
  puts n
end
p new_array

```
Answer :

The code outputs the elements of the array `[1, 2, 3, 4, 5, 6, 7, 8, 9, 10]` first and then outputs and returns an array with value `[nil, nil, nil, nil, nil, nil, nil, nil, nil, nil]`.

On `line 1` local variable `arr` is initialized to an array of integer elements `[1, 2, 3, 4, 5, 6, 7, 8, 9, 10]`.

On `line 3` local variable `new_array` is initialized to the return value of the method `map` called on local variable `arr` with `do..end` block passed as an argumnent with one parameter `n`. The method `map` transforms the array based on the return value of the block. A new collection is returned which is made up of elements that are the return value of the block for every iteration. The code within the block is executed for every iteration. In this case the last line of the block `puts n` outputs the element for every iteration and always returns `nil`. Hence, the array returned will be `[nil, nil, nil, nil, nil, nil, nil, nil, nil, nil]` and this array is being referenced by the local variable `new_array`.

On `line 7` method `p` is called and local variable `new_array` is passed as an argument. This outputs and returns the object being referenced by the local variable which is the array `[nil, nil, nil, nil, nil, nil, nil, nil, nil, nil]`.

## Example 10
What does the following code return? What does it output? Why? What concept does it demonstrate?
```ruby
a = "hello"

[1, 2, 3].map { |num| a }

```
Answer :

The code outputs nothing and returns the array `['hello', 'hello', 'hello']`. 

On `line 1` local variable `a` is initialised to a string object with value `'hello'`. 

On `line 3`, method `map` is called on the array `[1, 2, 3]` and the the block `{..}` is passed as an argument with one parameter `num`. The method `map` returns a new array made up of the return value of the block for every iteration as the elements. In this case the return value of the block with expression `a` is the object the local variable `a` points to which is `'hello'` for every iteration. Hence, the array returned is `['hello', 'hello', 'hello']`.

## Example 11
What does the following code return? What does it output? Why? What concept does it demonstrate?
```ruby
[1, 2, 3].each do |num|
  puts num
end

```

Answer :

The code outputs `1`, `2`, `3` in that order and returns the array `[1, 2, 3]`.

On `line 1` the method `each` is called on the array `[1, 2, 3]` and the `do..end` block is passed as argument with one parameter `num`. The `each` method executes the code within the block for every iteration and returns the original array that it is called on. Here, for every iteration, the corresponding element of the array is assigned to the block parameter `num` and is available within the block as a local variable. The line `puts num` outputs the object being referenced by local variable `num` which is the corresponding array element for every iteration. The `puts` method returns `nil`. Thus, the elements of the array is output, that is the integer objects `1`, `2` and `3`. The `each` method returns the array that it is being called on and thus the array `[1, 2, 3]` is returned.

## Other Collection Methods

[Link to all examples below](https://launchschool.com/lessons/85376b6d/assignments/d86be6b5)

## Example 1

```ruby
[1, 2, 3].any? do |num|
  num > 2
end

```

On `line 1` the method `any?` is called on the array `[1, 2, 3]` and the `do..end` block is passed as argument with one parameter `num`. The method `any?` looks at the truthiness of the block for every iteration. If the block returns a truthy value of even one of the iteration, the method returns `true`, otherwise the method returns `false`. In this case the last expression in the block `num > 2` returns true for the the integer element `3` in the array and hence the method `any?` returns `true`.

## Example 2
```ruby
{ a: "ant", b: "bear", c: "cat" }.any? do |key, value|
  value.size > 4
end

```

Answer : 

On `line 1` the method `any?` is called on the hash and the `do..end` block is passed as argument with two parameters `key` and `value`. The `any?` method looks at the truthiness of the return value of the block for every iteration. If the block returns truthy for atleast 1 of the iterations, the method `any?` returns `true` otherwise it returns `false`. 

Here, the block parameters `key` and `value` reference the corresponding key, value for every iteration and are available within the block as local variables. Within the block the method `size` called on the local variable `value` which returns the the size of the string object it references as an integer. The expression `value.size > 4` carries out a comparison on every iteration and returns `true` or `false` based on the result of the comparison. In this case, the size of none of the values of the hash is greater than `4` and hence the block returns `false` for every iteration and thus the method `any?` returns `false`.

## Example 3
```ruby
[1, 2, 3].all? do |num|
   num > 2
end

```

Answer :

On `line 1` the method `all?` is called on the array `[1, 2, 3]` and the `do..end` block is passed as argument with one parameter `num`. The method `all?` looks at the truthiness of the return value of the block for every iteration. If the block returns a truthy value, that is anything apart from `false` or `nil` for every iteration, then the return value of the method is `true` otherwise it is `false`.

Here, on every iteration the corresponding element of the array is referenced by the block parameter `num` and is available within the block as a local variable. Within the block the expression `num > 2` carries out comparison and returns `true` or `false` based on the comparison. In this case the block returns `false` for the first two elements and `true` for the third element. Hence, the method `all?` returns `false`.

## Example 4

```ruby
{ a: "ant", b: "bear", c: "cat" }.all? do |key, value|
  value.length >= 3
end

```

Answer :

The above code returns `true`.

On `line 1` method `all?` is called on the hash `{ a: "ant", b: "bear", c: "cat" }` and the `do..end` block is passed as argument with two parameters `key` and `value`. The method `all?` evaluates the truthiness of the return value of the block for every iteration. If the return value of the block is truthy for all the iterations, then the method returns `true` else it returns `false`. 

In this case, the last expression of the block `value.length >= 3` returns `true` for all the iterations and hence, the method `all?` returns `true`.

## Example 5
```ruby
[1, 2, 3].each_with_index do |num, index|
  puts "The index of #{num} is #{index}."
end
```

Answer :

The above code outputs `'The index of 1 is 0.'`, `'The index of 2 is 1.'` and `'The index of 3 is 2'` in the same order and returns the array `[1, 2, 3]`.

On `line 1` the method `each_with_index` is called on the array `[1, 2, 3]` and the `do..end` block is passed as argument with two parameters `num` and `index`. The method `each_with_index` iterates over the elements of the array and executes the block for every iteration. It takes in two parameters the first representing the element in the array and the second one represents the index of the element. 

Within the block the expression `puts "The index of #{num} is #{index}."` uses string extrapolation and references the objects that the local variables `num` and `index` is pointing to. This outputs the string with the respective values for each iteration. After the method is done iterating it returns the original array on which it was called being `[1, 2, 3]`.

## Example 6
```ruby
{ a: "ant", b: "bear", c: "cat" }.each_with_object([]) do |pair, array|
  array << pair.last
end
```

Answer : 

The code returns an array with value `['ant', 'bear', 'cat']`.

On `line 1` the method `each_with_object` is invoked on the hash `{ a: "ant", b: "bear", c: "cat" }` and the `do..end` block is passed as argument. Along with this, the method `each_with_object` also takes a method argument which is a collection object that will be returned by the method. On top of that the block takes two arguments `pair` and `array` where `pair` represents an array containing the key and value for every iteration and `array` the collection object that was passed as an argument to the method. On every iteration the object referened by `array` is updated based on the code within the block. 

Within the block the method `<<` is invoked on the object being referenced by `array` and the return value of the method `last` called on the local variable `pair` is passed as an argument. Here the last value of the array being referced by `pair` is appended to the array being referenced `array`. On every iteration the value of the key-value is appended to the array. When the method `each_with_object` is  done iterating, the updated array is returned with value `['ant', 'bear', 'cat']`.


## Example 7
```ruby
{ a: "ant", b: "bear", c: "cat" }.each_with_object({}) do |(key, value), hash|
  hash[value] = key
end
```

Answer : 

The above code returns a hash with value `{ "ant" => :a, "bear" => :b, "cat" => :c }`.

On `line 1` the method `each_with_object` is invoked on the hash `{ a: "ant", b: "bear", c: "cat" }` and the `do..end` block is passed as argument. Also, the method takes a collection object as a method argument which in this case is an empty hash `{}`. The block has three parameters, two within parantheses `key` and `value` and another one `hash`. The parameters `key` and `value` represent the key and value for every iteration and the parameter `hash` represents the collection object that was passed as an argument to the method. On every iteration the collection object being referenced by `hash` is updated based on the code within the block.

Within the block the statement `hash[value] = key` creates key-value pairs in the hash being referenced by `hash`. Here the value of the key-value pair of the hash object on which the method was called becomes the key and the key becomes the value in the hash being referenced by `hash`. 

After, the method `each_with_object` is done iterating, a hash with value `{ "ant" => :a, "bear" => :b, "cat" => :c }` is returned.


## Example 8
```ruby
odd, even = [1, 2, 3].partition do |num|
  num.odd?
end

p odd 
p even
```

Answer :

On `line 1` the local variables `odd` and `even` are parallely intialized to the two sub arrays of the array returned by the method `partition` called on the array `[1, 2, 3]` with the `do..end` block passed as argument with one parameter `num`. The method `partition` returns a nested array where the inner arrays are seperated based on the return value of the block. The first nested array containing elements for which the return value of the block evaluates to `true` and the second one containing elements for which the return value of the `block` evaluates to `false`.

In this case, within the block the method `odd?` called on the local variable `num` returns `true` for odd elements and `false` otherwise. Thus, the array returned has two nested arays, the first one with all the odd elements and the second one with the rest of the elements. Hence, the local variables `odd` and `even` now refernce the arrays `[1, 3]` and `[2]` respectively.

On `line 5` the method `p` is called and the local variable `odd` is passed as argument. This outputs and returns the array being referenced by `odd` which is `[1, 3]`. On `line 6` the method `p` is called and the local variable `even` is passed as argument which outputs and returns the array referenced by `even` which is `[2]`. 


## Truthiness

## Example 1

What does the following code return? What does it output? Why? What concept does it demonstrate?
```ruby
a = "Hello"

if a
  puts "Hello is truthy"
else
  puts "Hello is falsey"
end
```

Answer : 

The code outputs `'Hello is truthy'` and returns `nil`.

On `line 1` local variable `a` is intialised to the string `'Hello'`. On `line 3` `if` statement is used and `a` is given as a condition. The local variable `a` points to the string object `'Hello'` and is considered truthy and hence the code `puts "Hello is truthy"` is executed which outputs the string passed as an argument to the puts method and returns `nil`.

The concept of truthiness is demonstrated here. The string object `'Hello'` is considered to be truthy. Everything in Ruby is considered to be truthy apart from `false` or `nil`. 

Example 2
What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
def test
  puts "written assessment"
end

var = test

if var
  puts "written assessment"
else
  puts "interview"
end
```

Answer :

The above code outputs `'written assessment'` and `'interview'` and returns `nil`.

On `line 1 to 3` a method `test` is defined. 

On `line 5` local variable `var` is initialised to the return value of the method call `test`. The method `test` outputs the string `'written assessment'` and returns `nil`. Now, the local variable `var` references `nil`. 

On `line 7` the `if` statement is used with the condition being `var`. Since `var` points `nil` it evaluates to `false` and hence the `else` branch is executed which outputs `interview` and returns `nil`.



## Lesson 4 -> practice problems

## Practice Problem 1

What is the return value of the select method below? Why?

```ruby
[1, 2, 3].select do |num|
  num > 5
  'hi'
end
```

Answer :

The return value of the `select` method in the code is an array `[1, 2, 3]`.

On `line 1` the `select` method is invoked on the array `[1, 2, 3]` and the `do..end` block is passed as an argument with one parameter `num`. The `select` method evaluates the return value of the block for every iteration. If the block returns a truthy value, the element for that iteration is selected and placed in a new collection. In this case the last line of the block is `'hi'` and thus the block returns `'hi'` for every iteration, which is truthy as it is neither `false` nor `nil`. Hence, all the items in the array that `select` method is called on are selected and placed in a new array which is returned by the method.

## Practice Problem 2

How does count treat the block's return value? How can we find out?

```ruby
['ant', 'bat', 'caterpillar'].count do |str|
  str.length < 4
end
```

Answer :

The method evaluates the block's return value. It returns an integer is equal to the number of times the block returns a truthy value while iterating through the elements of the array. 

In this case the method `count` is called on the array `['ant', 'bat', 'caterpillar']` and the `do..end` block is passed as an argument with one parameter `str`. Within the block, the statement `str.length < 4` returns true for two elements of the array `'ant'` and `'bat'` and hence the method returns the integer `2`.

## Practice Problem 3

What is the return value of reject in the following code? Why?

```ruby
[1, 2, 3].reject do |num|
  puts num
end
```

Answer : 

The return value of the `reject` method in the code is an array with value `[1, 2, 3]`. 

The `reject` method evaluates the truthiness of the return value of the block on every iteration. If the block returns a falsey value, that is `false` or `nil`, the element for that iteration is selected and placed in a new collection. When the `reject` method is done iterating, it returns a new array containing all the selected elements. 

In this case the last line of the block is `puts num` which returns `nil` for every iteration and hence all the elements of the array are selected. It returns a new array with all the elements of the original array on which it was called.


## Practice Problem 4

What is the return value of each_with_object in the following code? Why?

```ruby
['ant', 'bear', 'cat'].each_with_object({}) do |value, hash|
  hash[value[0]] = value
end
```

The return value of the `each_with_object` method in the code is hash with value `{ 'a' => 'ant', 'b' => 'bear', 'c' => 'cat' }`.

The method `each_with_object` is called on the array `['ant', 'bear', 'cat']` with the `do..end` block and the object `{}` which is an empty hash are passed as arguments with two parameters `value` and `hash`. The object `{}` is passed in the block and its updated value is returned at the end of every iteration. Once, the method is done iterating it returns the object with all the updates. 

In this case, on iteration 1 a key value pair `'a' => 'ant'` is added to the hash, on iteration 2 `'b' => 'bear'` is added and on iteration 3 `'c' => 'cat'` is added and a hash with all those key value pairs is returned at the end.

## Practice Problem 5

What does shift do in the following code? How can we find out?

```ruby
hash = { a: 'ant', b: 'bear' }
hash.shift
```

Answer :

The method `shift` destructively removes the first key-value pair in the hash and returns it as a two item array. In this case the method `shift` called on the local variable `hash` returns the array `[:a, 'ant']`.

## Practice Problem 6

What is the return value of the following statement? Why?

```ruby
['ant', 'bear', 'caterpillar'].pop.size
```

Answer : 

The method `pop` destructively removes the last element of the array which is the string element `caterpillar` and returns it on which the method `size` is called which returns the length of the string as an integer. Here the value returned is the size of string `'caterpillar'` which is the integer `11`.

## Practice Problem 7

What is the block's return value in the following code? How is it determined? Also, what is the return value of any? in this code and what does it output?

```ruby
[1, 2, 3].any? do |num|
  puts num
  num.odd?
end
```

Answer :

The return value of the `do..end` block in the code is the return value of the last expression within the block which is `num.odd?`. 

The method `any?` evaluates the truthiness of the block. If the block ever returns a truthy value, the method returns `true`. 

In this case, the block returns `true` for the first iteration as the element `1` is odd and hence the method `any?` returns `true`. After the first iteration, the method stops iterating and thus the `puts num` is only executed for the first element of the array `1`. 

So, the code outputs `1` and returns `true`.

## Practice Problem 8

How does take work? Is it destructive? How can we find out?

```ruby
arr = [1, 2, 3, 4, 5]
arr.take(2)
```

Answer :

The method `take` is called on an array with an integer as the argument. It returns a new array with the specified number of elements starting from the first element. The method `take` is not destructive.

The method `take` in the code above returns an array with value `[1, 2]`.

## Practice Problem 9 

What is the return value of map in the following code? Why?

```ruby
{ a: 'ant', b: 'bear' }.map do |key, value|
  if value.size > 3
    value
  end
end
```

Answer :

The return value of the `map` method in the given code is an array with value `[nil, 'bear']`. 

On `line 1` the method `map` is called on the hash `{ a: 'ant', b: 'bear' }` and the `do..end` block is passed as argument with two parameters `key` and `value`. The `map` method evaluates the return value of the block for every iteration. The method returns a new array made up of the return values of the block for every iteration.

In this case the for the 1st key-value pair, the return value of the block is `nil` as none of the `if` statements returns `true` and for the 2nd key-value pair the return value of the block is the string `bear`. Hence, the method returns an array with value `[nil, 'bear']`.

## Practice Problem 10

What is the return value of the following code? Why?

```ruby
[1, 2, 3].map do |num|
  if num > 1
    puts num
  else
    num
  end
end
```

Answer :

The return value of the given code is an array `[1, nil, nil]`. 

On `line 1` the method `map` is called on the array `[1, 2, 3]` and the `do..end` block is passed as argument with one parameter `num`. The `map` method returns a new array made up of the return values of the block for every iteration. In this case the the `if` statement evaluates as `false` for the 1st element and as a result the `else` branch is executed thereby returning the integer `1` for that iteration. For the 2nd and 3rd iteration the `if` statement evaluates as `true` and hence the expression `puts num` is executed. Since the `puts` method always returns `nil`, the block returns `nil` for the 2nd and 3rd iterations. Thus the `map` method returns an array with value `[1, nil, nil]`.

# Trial 

## Object Mutability 

## Example 1

```ruby
def fix(value)
  value.upcase!
  value.concat('!')
  value
end

s = 'hello'
t = fix(s)

```
What values do `s` and `t` have? Why?

Answer :

On lines 1 - 5 a method `fix` is defined with one parameter `value`.

On line 7 local variable `s` is initialised to the string object `'hello'`. 

On line 8 local variable `t` is initialised to the return value of the method `fix` being called with local variable `s` as the argument. The method paramater `value` now refernces the string object being referenced by the local variable `s` and is available within the method definition as local variable in that scope. On line 2 the method `upcase!` is called on the string object being referenced by local variable `value`. Since, the method `upcase!` is a destructive method, the string object being referenced by the local variable `value` is changed to `'HELLO'`. On line 3 the method `concat` is called on the string object being referenced by the local variable `value` and the string `'!'` is passed as an argument. Since, the method `concat` is a destructive method, the string object being referenced by the local variable `value` which is also the string object being referenced by the local variable `s` in the outer scope is now changed to `'HELLO!'`. On line 4 the string object being referenced by local variable `value` is returned and that is the return value of the method `fix`. 

Now, the local variables `s` and `t` point to the same string object with value `'HELLO!'`.


## Object Mutability / Mutating Methods
## Example 4

What does the following code return? What does it output? Why? What concept does it demonstrate?
```ruby
def fix(value)
  value = value.upcase!
  value.concat('!')
end

s = 'hello'
t = fix(s)
```

What values do `s` and `t` have? Why?

Answer :

The local variables `s` and `t` point to the same string object with value `'HELLO!'`.

On `lines 1 to 4` a method `fix` is defined with one parameter `value`.

On `line 6` local variable `s` is initialized to a string object `'hello'`. On `line 7` local variable `t` is initialized to the return value of the method `fix` being called with local variable `s` as argument.

After the method invocation, the method parameter `value` references the object being referenced by the local variable `s` and is avaiable as a local variable within the method body in that scope. On `line 2` the local variable `value` is reasignned to the return value of the method `upcase!` called on the object being referenced by the local variable `value`. The method `upcase!` is a destructive method and modifies the string being referenced by the local variable `value`. The string is now, modified to `'HELLO'` and this modifie string is returned which is now being referenced by the local variable `value`. Now, the local variable `value` and the local variable `s` in the outer scope point to the same string object with value `'HELLO'`. On `line 3` the method `concat` is called on the string being referenced by the local variable `value` and the string `'!'` is passed as an argument. The method `concat` is a destructive method, and thus modifies the string being referenced by `value` to `'HELLO!'` and since this is the last line of the method `fix` this is what is returned. 

Now, local variable `s` and `t` point to the same string `'HELLO!'`.

## Each, Map, Select

## Example 5
What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
words = %w(jump trip laugh run talk)

new_array = words.map do |word|
  word.start_with?("t")
end

p new_array
```

Answer :

The code outputs and returns an array `[false, true, false, false, true]`.

On `line 1` local variable `words` is intialized to an array which has all string elements. 

On `line 3` local variable `new_array` is initialized to the return value of the method `map` being called on the array being referenced by the local variable `words` with the `do..end` block passed as argument with one parameter `word`.

The method `map` evaluates the return value of the block for every iteration and returns a new array made up of elements which are the return value of the block for every iteration. In this case, within the block the method `start_with?` is called on the object being refereneced by the local variable `word` and the string `'t'` is passed as argument. This method call returns `true` or `false` depending on whether the first character of the string object that the method is being called on is `'t'`. Here, the method returns `true` for the 2nd and 5th elements of the array and `false` for all other elements. After the `map` method is done iterating, an array `[false, true, false, false, true]` is returned and the local variable `new_array` now points to it.

On `line 7` the method `p` is invoked and local variable `new_array` is passed as argument. This outputs and returns the array being referenced by the local variable `new_array` which is `[false, true, false, false, true]`.



