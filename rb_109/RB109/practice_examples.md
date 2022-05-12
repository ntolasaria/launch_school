```ruby
greeting = 'Hello'

loop do
  greeting = 'Hi'
  break
end

puts greeting

```
The local variable `greeting` is assigned to the string `'Hello'` on line 1. The `do..end` alongside the `loop` method invocation on lines 3 to 6 defines a block within which `greeting` is reassigned to the String `'Hi'` on line 4. The `puts` methos is called on line 8 with th variable `greeting` passed to it as an argument; since `greeting` is now assigned to `'Hi'`, this is what is output. This example demonstrates local variable scoping rules in Ruby; specifically the fact that a local variable initialized outside of a block is accessible inside the block.


```ruby
def a_method
  puts "hello world"
end 
```
The method outputs the string `'hello world'`and returns `nil`.

```ruby
greeting = 'Hello'
```

The `greeting` variable is assigned to the string `'Hello'`.
The string `'Hello'` is assigned to the `greeting` variable.

**Both are correct**

```ruby
a = "Hello"

if a
  puts "Hello is truthy"
else
  puts "Hello is falsey"
end

```

Right options :

1. `a` evaluates as true in the conditional statement and so 'Hello is truthy' is output.
2. `a` is truthy and so 'Hello is truthy'is output.


**Example - Srdjan**


1.

```ruby
a = 'hello'
b = a
a = 'goodbye'
```
On `line 1` of this code we are initializing the local variable `a` to a string object with value `hello` to it.

On `line 2` we are initializing the local variable `b` to a string onject that the local variable `a` is refrencing. Currently, both of these local variables are pointing to the same object.

On `line 3` we are reassigning the local variable `a` to a different string object with value `goodbye` so now, the local variable `a` is pointing to one string object woth value `goodbye` and the local variable `b` is pointing to a string object with value `hello`.




2.

```ruby
def example(str)
  i = 3
  loop do
    puts str
    i -= 1
    break if i == 0
  end
end
example('hello')
```

---
#Heading 1
##Heading 2
###Heading 3

**[Link to Website](https://www.ambientgroup.net)**

```ruby
def method(paramater)
   some_method
end
```
