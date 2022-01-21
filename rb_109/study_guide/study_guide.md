
# Part 1: Study Guide for Test
Assessment RB109 will test your knowledge of courses LS100 and RB101, which has a huge surface area in that it covers the Ruby programming language broadly. It will not cover Object Oriented Programming.

## Specific Topics of Interest

You should be able to clearly explain the following topics:

1. **local variable scope, especially how local variables interact with method invocations with blocks and method definitions**

Points to note :

- outer scope variables can be by accessed by inner scope (created by blocks - {..} or do..end)
- inner scope variables cannot be accessed in outer scope(variables initialized in the inner scope)
- peer scopes do not conflict (variable initialized in one block cannot be accessed in another peer block)
- nested blocks follow the same rules of inner and outer scoped variables based on the level of the nested block.
- variable shadowing 
  example -

```ruby
n = 10
[1, 2, 3].each do |n|
  puts n
end
```
Since, the block parameter has the same name as a localvariable outside the block, being variable `n`,variable shadowing takes place and prevents access tothe local variable within the block. 
The `puts n` will use the block parameter and disregardthe outer scoped local variable. Variable shadowingalso prevents changes from being made to the outerscoped variable `n`.

- a method definition can't access local variables in another scope.
- a method definition can access objects passed in as an argument. The object passed in gets assigned to the method parameter and is thus made available to the method body as a local variable.
- if local variable and method share the same name, 
Ruby first searches for the local variable and if it is not found then Ruby tries to find a method with the given name. Ambiguity can be avoided by adding a set of empty argument parentheses with the method invocation.
- scoping rules for method invocation with a block remain in full effect even if working inside a method definition.
- CONSTANTS have different scoping rules. They behave like globals. CONSTANTS initialized within a block will be avaiable outside the scope of the block.


2. **mutating vs non-mutating methods, pass-by-reference vs pass-by-value**
   
Points to note
  
***pass-by-reference vs pass-by-value :***
- Ruby behaves like pass-by-value at times, likere-assigning the object within the method doesn'taffect the object outside the method. Example :

```ruby
def change_name(name)
  name = 'bob'      # does this reassignment changethe   object outside the method?
end
name = 'jim'
change_name(name)
puts name           # => jim
```
 - Ruby behaves like pass-by-reference at times. Example :
    
```ruby
def cap(str)
  str.capitalize!   # does this affect theobjecoutsidethe method?
end

name = "jim"
cap(name)
puts name           # => Jim
```


The above code implies that Ruby is "pass byreference"as operations wthin the method affectedthe originalobject. This would not happen if themethod `capitalize`was used instead of`capitalize!`. 

- Basically, Ruby exhibits a combination of both. **"When an operation within the method mutates the caller, it will, it will affect the original object"** 
  
***mutating vs non-mutating methods***

```ruby
a = [1, 2, 3]
# Example of a method definition that mutates its argument permanently
def mutate(array)
  array.pop
end
p "Before mutate method: #{a}" # => [1, 2, 3] 
mutate(a)
p "After mutate method: #{a}" # => [1, 2]
```

The above code permanently modified the array that local variable `a` references by passing it to the mutate method, even though `a` is outside the method definition's scope. This is because the `pop` method mutates the caller (the array referenced by `array`). `a` is still pointing to the same array, but in this case, the array has changed, more precisely the number of elements in the array has chnaged. 

The same code with a non-mutating method like `last` would not mutate the caller and hence would not change the array being referenced by `a`.


3. **working with collections (Array, Hash, String), and popular collection methods (each, map, select, etc).** Review the two lessons on these topics thoroughly.
  **study RB 101 - lesson_4 part 2, 7, 8, 9.**

Points to note -

Collections - String, Array, Hash

- Collections are made up of individual elements. To work with them, its need to be known how they are structured and how to reference and assign the individual elements within them.

**String**
- Strings are not true collections. Collections contain multiple objects, while strings contain only a single object. The individual characters are not objects, nut are just part of the object that contains the string value.
- Strings act like collections since you can access and assign each character individually. However, when you access a single character of the string with something like `str[2]`, the return value is a brand new string - each time you call `str[2], it returns a new string. Example :
```ruby
char1 = str[2]                     # => "c"
char2 = str[2]                     # => "c"
char1.object_id == char2.object_id # => false

```
If `str` were a real collection, the `char1` and `char2` objects would have the same `object_id`.

- Refencing an out-of-bound index returns `nil`. Example :
```ruby
str = 'abcde'
str[5] # => nil

```

**Array**

- Arrays are ordered, zero indexed collections.
- Arrays are lists of elements that are ordered by index, where each element can be any abject. Arrays use an integer based index to maintain the order of its elements. A specific element cab be referenced using its index.
- Referencing an out of bound index, returns `nil` just like in strings. `#fetch` method can be used which returns an error if the index is out of bounds.
- Arrays can be refenced using negative indices as well. `-1` represents the last value of an array and goes left ways from there.

**Hash**

- Hashes are collections that instead of using an integer based index, uses key-value pairs, where the key or the value can be any type or Ruby object.
- The keys must always be unique, the values however can be duplicated. If there are same named keys during initiliazation , the value coming later in the intialization is overwritten to the respective key value.
- `#keys`, `#values` are methods which can access just the keys and values of a hash respectively. These methods return an array of the keys, values respectively.
- Similar to Strings and Arrays, `#[]` for hash also returns `nil` when the key specified is invalid. `#fetch` method can be used to distinguish which returns an error if the key is invalid.

**Collection Methods (each, map, select)**

`each`

- For Arrays - `each` is a method called on an array that takes a block, either `do..end` or `{..}`, the code within the block is executed for each iteration. On every iteration the corresponding element of the array is assigned to the block parameter. Hence, it has only one parameter. The `each` method returns the original array. 
- For Hash - `each` works in a similar way to Arrays, however two arguments are sent to the block representing the key and the value per iteration. The original collection / hash is returned by the method.

`select`

-For Array - `select` method evaluates the return value of the block. The block returns a value on each iteration, which then gets evaluated by `select`. Similar to a real method, the return value of the block is the return value of the last expression within the block. When evaluating the block's return value, `select` only looks at its truthiness. Everything in Ruby is considered truthy expect for `false` and `nil`. If the return value of the block is truthy, then the element during that iteration will be selected. If the return value is `false` or `nil` then the element will not be selected. When an element is selected, its places in a new collection. When the `select` method is done iterating, it returns a new collection containing all of the selected elements. If the block returns falsey for every iteration, an empty array is returned.  

`map`

- For Array - `map` method is used for transformation. `map` uses the return value of the block to perform transformation. It returns a new collection made up of elements which are the return value of the block for every iteration. 

`Array` and `Hash` both have an `each` method which is specific to them.

The `select` and `map` methods are defined in the module **Enumerable** and are made available to `Array` and `Hash` classes.

**Do practice problems - lesson 4 -> part 10**


4. **variables as pointers**

- Variables don't actually contain a value, instead they contain a pointer to a specific area in memory that contains the value. 
- Some operations mutate the address space, while others simply make the variable point to a different address space.
- If a method is called that mutates the caller, it will change the value in that object's address space. In case of reassignment, the variable will point to a different address space.

Examples :

```ruby
a = "hi there"
b = a
a  "not here"

```

`b` points to the string `"hi there"` in the above code. The line `a = "not here"` reassigned the variable `a` to a completely different address in memory, its not pointing to an entirely new string. This is what the `=` operator does. Infact, different spaces can in hold the same value but they are still different places in memory, that is they are different objects. Even, if the last line was `a = "hi there"`, the result would be the same, `a` and `b` in that case would still point to different addresses in memory, they would just happen to have the same value.

```ruby
a = "hi there"
b = a
a << ", Bob"

```
Variables `a` and `b` both point to the string `"hi there, Bob"`.

Here, the line `a << ", Bob"` did not result in reassigning `a` to a new string. Rather, it mutated the caller and modified the existing string, which is also pointed to by the variable `b`. This explains why `b` reflects the changes to `a` - they're both pointing to the same thing.


5. **puts vs return**

- An **expression** is anything that can be evaluated, pretty much everything written in Ruby is an expression. An expression in Ruby always returns something, even if that's an error message or `nil`. 
- `puts` method prints something on the screen, However, `puts` does not return what is printed to the screen. Expressions do something, but they also return something. the value rerurned is not necessarily the action that was performed. `puts` method always returns `nil`.
- Every method in Ruby returns the last evaluated result of the last line that is executed.
- To explicitly return a value,the `return` keyword can be used. When `return` is added in a method, it just returns the return value of the expression following it without executing the next lines. Example :

```ruby
def add_three(number)
  return number + 3
  number + 4
end

returned_value = add_three(4)
puts returned_value 

```
The above code outputs `7` and returns `nil`. When `return` is used, it just returns the result of `number + 3`, which is 7 without executing the next line. `return` is not required, it is just used to explicitly return something from a method.



6. **false vs nil and the idea of "truthiness"**

- In Ruby, booleans are represented by `true` and `false` objects. Boolean objects, like everything else in Ruby has real classes behind them and methods can be called on `true` and `false`. `true` belongs to `TrueClass` and `false` belongs to `FalseClass`.
  
- Truthiness differs from `true` in that Ruby considers more than the `true` object to be truthy. In fact, Ruby considers everything to be truthy other than `false` and `nil`.
  
- This means that we can use any expression in a conditional, or with logical operators, and as longs as it doesn't evaluate to `false` or `nil`, it is considered truthy. Examples :

```ruby
num = 5
if num
  puts "valid number"
else
  puts "error!"
end

```
The code outputs `"valid number"`. The reason is because Ruby considers `num` which points to an integer to be truthy because it is neither `false` or `nil`. It does not howver mean that the `num` variable from above is equal to `true`. Explained as follows :

```ruby
num = 5
num == true   # => false

```
- `&&` - and operator - will return `true` only if both expressions being evaluated are true. Any number of expressions can be chained with `&&`, and it will be evaluated left to right. If any expression is `false`, the entire `&&` chain will return `false`. 
- `||` - or operator - will return `true` if either one of the evaluated objects is `true`. Only way to return `false` is if all expressions are `false`.
- Short Circuiting : the `&&` and `||` operators exhibit a behaviour called short circuiting, which means it will stop evaluating expressions once it can guarantee the return value. Explained as follows :

```ruby
irb:001> false && 3/0 
=> false
```
The above code doesn't generate a `ZeroDivisionError` because the `&&` operator didn't even evaluate the second expression, since the first expression is `false`, it can short circuit and return `false`.

```ruby
irb:001> false || 3/0
ZeroDivisionError: divided by 0
```
Here the error is generated.

The `||` will short circuit when it encounters the first `true` expression.

```ruby
irb:001> true || 3/0
=> true
```

The above code doesn't generate a `ZeroDivisionError` because `||` didn't evaluate the second expression, it short circuited after encountering `true`.

**In Ruby everything is considered "truthy" except for `false` and `nil`.**


7. **method definition and method invocation**

- Often there is a piece of code that needs to e executed many times in a program. Instead of writing that piece of code over and over, the piece of code can be extracted to one place. In Ruby, it is called a method. 
- First we use it, a method must be defined with the reserved word `def`, after which we give the method name. At the end of the method definition, the word `end` must be used to denote its completion. Example :

```ruby
def say
  # method body goes here
end

```
- A method is called (or invoked) by typing its name and passing in arguments. Example :

```ruby
def say(words)
  puts words
end

say("hello")
say("hi")
say("how are you")
say("I'm fine")

```
- The method `say` is called by typing it's name and passing in arguments. In the method definition `(words)` after `say` is the parameter. Parameters are used when there is data outside of a method definition's scope but needs to be accessed within the method definition. If the method definition does not need access to any outside data, parameters need not be defined.
- Arguments are pieces of information that are sent to a method invocation to be modified or used to return a specific result. When arguments are passed to a method, for instance in the above example the method `say`, they are assigned to the method parameter `words` and are available as a local variable in the scope of the method definition. That is, this local variable in the method definition scope cannot be referenced outside the method definition. 
- When `say("hello")` is evaluated, the string `"hello"` is passed as argument in place of the `words` parameter. The code within the method definition is executed with `words` local variable pointing to the string object `"hello"`.
- method invocation `say("hello")` can also be written as `say "hello"`.
- Methods can be invoked with a block. Example of method invocation with a block :

```ruby
[1, 2, 3].each do |num|
  puts num
end

```

- methods can be called in two ways. `some_method(obj)` is one way. `obj` is the argument being passed to the method `some_method`. Sometimes, methods are called with an explicit caller like `a_caller.some_method(obj)` which is basically `some_method` modifying `a_caller`.

- The term method invocation is also used to refer to calling a method.


8. **implicit return value of method invocations and blocks**

Some observations - 
- `break` returns `nil` when executed. Example :

```ruby
loop do 
  p "something"
  break
end

```

The above code returns outputs `"something"` and returns `nil`, because the last line is executed is `break` which returns `nil`.

- In a method if the `if` statement is not truthy for all the conditions therein, it returns `nil`, else the return value of the method is the return value of the last line of the branch of `if` statement that is truthy and is executed. Example :

```ruby
def some_method(val)
  if val
    p "executed"
  end
end

some_method(false)

```
The above code returns `nil` and outputs nothing. Since the `if` statement evaluates to false and is not executed it returns `nil` and hence the method returns `nil`. 

- method returns the return value of the last statement executed if there is not explicit `return`. In case the keyword `return` is used, the method returns the expression following `return`, the lines after that are ignored.
  
9. **how the Array#sort method works**

- Sorting - Sorting is setting the order of the items in a collection according to a certain criterion. 
- Ruby provides `sort` and `sort_by` methods to achieve this.
- Example of implementation of `sort` method :

```ruby
[2, 5, 3, 4, 1.sort]  # => [1, 2, 3, 4, 5]

```
The return value is a **new array** with the integers ordered sequentially according to their value.

- Sorting is carried out by comparing the items in a collection with each other and ordering them based on the result of that comparison. For strings it works as follows :

```ruby
['c', 'a', 'e', 'b', 'd']sort # => ['a', 'b', 'c', 'd', 'e']
```

`sort` method above returns a new array of characters ordered alphabetically.

- `sort` method uses the `<=>` method (also referred to as the 'spaceship' operator) to determine the order of elements.
- `<=>` method performs comparison between two objects of the same type and returns `-1` , `0`, or `1` depending on whether the first object is less than, equal to or greater than the second object. If the two objects cannot be compared then `nil` is returned. Examples :

```ruby
2 <=> 1 # => 1
1 <=> 2 # => -1
2 <=> 2 # => 0
'b' <=> 'a' # => 1
'a' <=> 'b' # => -1
'b' <=> 'b' # => 0
1 <=> 'a' # => nil
```
- Its important to understand how comparison is implemented for different objects types like `String` and `Integer`. For `String` order is determined by a character's position in the ASCII table. For instance :

```ruby
'A' <=> 'a' # => -1 
'!' <=> 'A' # => -1 
# ASCII value can be determined as follows :
'b'.ord # => 98
'}'.ord # => 125
# Hence
'b' <=> '}' # => -1
```

Some basic rules to remember 
  - Uppercase letters come before lowercase letters
  - Digits and most punctuation come before letters
  - There is an extended ASCII table containing accented and other characters - this comes after the main ASCII table.

- `sort` method can be called with a block. The block needs two arguments passed to it which are the two items to be compared and the return value of the block has to be `-1`, `0`, `1` or `nil`. Examples of usage :

```ruby
[2, 5, 3, 4, 1].sort do |a, b|
  a <=> b
end
# => [1, 2, 3, 4, 5]

# This can be reversed as well 

[2, 5, 3, 4, 1].sort do |a, b|
  b <=> a
end
# => [5, 4, 3, 2, 1]
```

Additional code can be written in the block, as long as the block returns `-1`, `0`, `1` or `nil`.

```ruby
[2, 5, 3, 4, 1].sort do |a, b|
  puts "a is #{a} and b is #{b}"
  a <=> b
end
# a is 2 and b is 5
# a is 5 and b is 3
# a is 2 and b is 3
# a is 5 and b is 4
# a is 3 and b is 4
# a is 5 and b is 1
# a is 4 and b is 1
# a is 3 and b is 1
# a is 2 and b is 1
# => [1, 2, 3, 4, 5]
```

- When two objects cant be compared `nil` is returned and an error is thrown.

- `sort_by` method is similar to `sort` but is usually called with a block. The code in the block determines how the items are compared. Example :

```ruby
['cot', 'bed', 'mat'].sort_by do |word|
  word[1]
end
# => ["mat", "bed", "cot"]
```

Here the elements are being sorted based on the character at index `1`, that is the second character of each string. Basically, the characters `o`, `e` and `a` are compared and the strings are ordered according to the result of the comparison of those characters. The other characters in the string are ignored entirely.

- Usually `Hash` doesn't need to be sorted, however if required `sort_by` can be called on it to do so. When calling `sort_by` on a hash, two arguments need to be passed - the key and the value. The last argument evaluated in the block should be the thing by which the sorting will take place. Example :

```ruby
people = { Kate: 27, john: 25, Mike: 18 }

people.sort_by do |_, age|
  age
end
# => [[:Mike, 18], [:john, 25], [:Kate, 27]]
```

`sort_by` always returns an array, even when called on a hash, so as seen above the result is a new array with the key-value pairs as objects in the nested arrays. It can be converted back to a hash by calling `Array#to_h` on it.

It can also be sorted by name. In this case the names are symbols. In Ruby symbols are compared using the method `Symbol#<=>` after `to_s` is called on them, so effectively it is comparing strings. However in this case one of the names, `:john` is not capitalized which will make the comparison incorrect. So in order to deal with the problem the method `Symbol#capitalize` can be used on each name within the block so when the keys are compared they are all capitalized. 

```ruby
people.sort_by do |name, _|
  name.capitalize
end
# => [[:john, 25], [:Kate, 27], [:Mike, 18]]
```
`Array#sort` and `Array#sort_by` have equivalent destructive methods `Array#sort!` and `Array#sort_by!`. With these methods the same collection is sorted and a new collection is not returned.


##How to Answer the Assessment Questions
The questions in this assessment will typically be testing your knowledge and understanding on more than one level.
On one level the question is testing your ability to parse code and to describe it with precision, or testing your knowledge of some specific syntactical aspect or language-specific feature of the Ruby programming language.
On another level, the question is checking your understanding of some deeper, underlying principle; this might be some more fundamental aspect of the Ruby language, or a non-language-specific concept that applies to programming more generally.
When answering the questions, you should:
Explain your reasoning with reference to specific lines in the program. You can use line numbers to refer to specific lines of code where necessary.
Answer with precision. For example, say "method declaration" or ",method invocation" as opposed to just "method" when the distinction is important.
Highlight any specific syntactical conventions or technical observations where relevant.
Identify the key fundamental concept or concepts being demonstrated in the question.
Example
Examine the code example below. The last line outputs the String 'Hi' rather than the String 'Hello'. Explain what is happening here and identify the underlying principle that this demonstrates.
Copy Code
greeting = 'Hello'

loop do
  greeting = 'Hi'
  break
end

puts greeting








Compare the following possible answers to this question:
A) greeting is set to 'Hello' on line 1. greeting is set to 'Hi' on line 4. Line 8 outputs greeting, which is 'Hi'.
B) The local variable greeting is assigned to the String 'Hello' on line 1. Within the loop, greeting is then reassigned to the String Hi on line 4. The puts method is called on line 8 with the variable greeting passed to it as an argument; since greeting is now assigned to 'Hi', this is what is output.
C) The local variable greeting is assigned to the String 'Hello' on line 1. The do..end alongside the loop method invocation on lines 3 to 6 defines a block, within which greeting is reassigned to the String Hi on line 4. The puts method is called on line 8 with the variable greeting passed to it as an argument; since greeting is now assigned to 'Hi', this is what is output.
D) The local variable greeting is assigned to the String 'Hello' on line 1. The do..end alongside the loop method invocation on lines 3 to 6 defines a block, within which greeting is reassigned to the String Hi on line 4. The puts method is called on line 8 with the variable greeting passed to it as an argument; since greeting is now assigned to 'Hi', this is what is output. This example demonstrates local variable scoping rules in Ruby; specifically the fact that a local variable initialized outside of a block is accessible inside the block.
While none of these answers is technically incorrect, they all answer the question with varying degrees of detail and precision.
Answer 'A' describes what is happening in the code example, but does so in a fairly basic way with imprecise language. This wouldn't be a sufficient response to receive full points for any of the questions in the assessment.
Answer 'B' again describes what is happening, but with much greater precision of language. This would score higher than Answer 'A', but generally wouldn't be sufficient to receive full points for the majority of questions; most questions in the assessment are looking for something more, such as a specific piece of syntactical knowledge and perhaps identification of some fundamental concept.
Answer 'C', as well as precisely describing the example, identifies an important Ruby syntactical convention that is relevant to the example: the fact that the method invocation combined with do..end defines a block in Ruby. For some assessment questions this might be sufficient to receive full points, but many questions will expect you to demonstrate some deeper understanding of the fundamental concept that this illustrates.
Answer 'D' goes a step further than 'C' by explaining why this is important and the underlying principle that it demonstrates; i.e. the fact that method invocations with blocks in Ruby have particular scoping rules which affect whether or not the local variable can be referenced or reassigned. Based on the way that this particular question is phrased, answer 'D' would be the only answer of the four to receive full points in an actual assessment.
Bullet Points
Many students attempt to use bullet points to answer the questions on the exam. This makes sense in some situations:
You have a list of explicit reasons why some code does what it does.
You have a list of pros and cons about.
You want to provide a list of things.
In short, they work well for lists. (Notice that we used a bullet list to list this list of lists!) However, they don't always work as complete answers for a question. You don't speak in bullet lists; don't write with bullet lists.
To illustrate, consider the following hypothetical explanation of the example code from the previous section:
Line 1 declares a variable named greeting and initializes it as 'Hello'.
Line 3 begins a loop that keeps on repeating forever until the code breaks out of the loop.
Line 4 reassigns greeting to 'Hi'.
Line 5 breaks out of the loop.
Line 8 prints the value of greeting.
Variables defined outside a block are accessible inside the block.
This answer is essentially a laundry list of statements about the code. Unfortunately, laundry lists aren't very effective as answers on the assessment. They are difficult to follow, and often leave it to the reader to piece together the logic behind the list.
In the above list, for instance, there's no logical progression that actually explains what is happening. Instead, the student has simply listed a bunch of statements about each line of code, plus one unrelated item that talks about scope. However, a program is not a series of independent lines of code. Code depends on what happened before, and it influences what happens later. There's nothing in the laundry list that connects those individual bits of code together.
From the grader's point of view, this answer is incomplete:
It doesn't mention what happens when the loop runs.
it doesn't talk about the fact that greeting on line 4 is the same variable as the one shown on lines 1 and 8.
It doesn't tie the statement about variables to the other statements.
In short, it leaves the grader with the burden of tying your bullet points together in a coherent whole.
These faults can be addressed, to a degree, in a bullet point answer. However, the laundry list approach often leads students to overlook these missing details. Paragraphs make it easier to think about the bigger picture since you're striving for clarity, not a list of everything you can think of.
Some students overcompensate by listing a bunch of facts that aren't really pertinent to the question. For instance, a typical answer might list several additional facts about this code:
loop is a method.
The words do and end and everything between them are a block.
'Hello' and 'Hi' are strings.
This is mostly clutter for the grader. You may also lose some points if the additional details say something that is incorrect.
In general, a clearly written paragraph is easier to understand and grade than a laundry list. While we won't penalize you for using bullet points, it's important to realize that bullet points have weaknesses that are difficult to see when you're writing.
Precision of Language
Most of the questions will require that you explain the code using words. It's important to be able to explain why something happens using precise vocabulary and be able to pinpoint the exact causal mechanism at work. In other words, be precise and don't be vague.
For example, let's take the following piece of code.
Copy Code
def a_method
  puts "hello world"
end



If asked to describe the method, you might be tempted to say "the results of the method is hello world". This isn't wrong, but for a programmer, it's extremely imprecise and doesn't help us understand the method. If you had written that as an answer, you'd score a 5/10 on the question (50% is not a passing score).
The more precise answer would be "the method invocation outputs the string hello world, and returns nil". In programming, we are always concerned with the output and the return value and mutations to objects. We need to speak in those terms, and not use vague words like "results".
When writing answers to the test questions, make sure to be as precise as possible, and use the proper vocabulary. Doing this will help you debug and understand more complex code later in your journey. If your definitions are not precise, you will not be able to lean on them to decompose complicated code. Also, you will likely not be able to pass this assessment.
Some Specifics
As well as requiring a general precision of language in your answers, for the purposes of the assessment there are a few areas where we would like you to refer to certain things in a very clear and fairly specific way; these are outlined below.
Assignments
Consider the following assignment statement:
Copy Code
greeting = 'Hello'
Most of the Launch School material describes this statement as:
The greeting variable is assigned to the string 'Hello'.
However, there are places where we describe this code as:
The string 'Hello' is assigned to the greeting variable.
Both of these are acceptable in the assessment. Try to be consistent though -- if you aren't consistent, your meaning may be confused.
Truthiness
In the assessment we want you to be very clear about the distinction between truthy and the boolean true (and similarly the distinction between falsey and the boolean false).
In Ruby, every value apart from false and nil, evaluates as true in a boolean context. We can therefore say that in Ruby, every value apart from false and nil is truthy; we can also say that false and nil are falsey. This is not the same as saying every value apart from false and nil is true, or is equal to true. These may seem like subtle distinctions but they are important ones.
Example:
Copy Code
a = "Hello"

if a
  puts "Hello is truthy"
else
  puts "Hello is falsey"
end







a is true and so 'Hello is truthy' is output" would be incorrect
a is equal to true and so 'Hello is truthy' is output" would be incorrect
a evaluates as true in the conditional statement and so 'Hello is truthy' is output" would be correct
a is truthy and so 'Hello is truthy' is output" would be correct
To sum up:
Use "evaluates to true", "evaluates as true", or "is truthy" when discussing an expression that evaluates as true in a boolean context
Do not use "is true" or "is equal to true" unless specifically discussing the boolean true
Use "evaluates to false", "evaluates as false", or "is falsy" when discussing an expression that evaluates as false in a boolean context
Do not use "is false" or "is equal to false" unless specifically discussing the boolean false
Method Definition and Method Invocation
When discussing methods, particularly in terms of how blocks and methods interact with local variables, we want you to explain this in terms of method definition and method invocation. You can review this assignment for an outline of the mental model to use.
Variable References and Object Mutability Articles
We wrote a series of blog posts that thoroughly cover variable references and object mutability:
Variable References and Mutability of Ruby Objects
Mutating and Non-Mutating Methods in Ruby
Object Passing in Ruby - Pass by Reference or Pass by Value
Spend some time reviewing these articles to ensure that you have a good understanding of these topics.
Assessment Prep Videos
We did a Beginning Ruby series that will serve as great review for this test. Specifically, the sessions that are relevant to this assessment are:
Part 1
Part 2
Part 3
Pay careful attention to the way the instructor explains concepts, and use that vocabulary to describe code on the test.
Additional Tips
While working through the assessment questions it is useful to run your code often to check it, so make sure to have either Ruby document/terminal or an online repl prepared beforehand.
Several Launch School students have blogged about their assessment experiences:
Zach had a rough time making his way through the first two Launch School assessments. In I Failed Programming 101 Three Times his struggle and frustration trying to pass these assessments, and how he eventually embraced the Launch School way.
Srđan prepared a four-part blog series in which he reviews the core concepts covered in course RB101 that should be mastered prior to taking the assessment.
Raúl talks about his preparation and experiences as a non-native English speaker in this interesting article.
Juliette wrote a blog article about her own strategy for Launch School's written assessment preparation.
Callie's blog article has a wealth of useful information about preparing for both parts of the assessment: the exam and the interview.
All of these articles are well worth your time; don't pass them up!
You marked this topic or exercise as completed.

Study Sessions
Part 1: Start the Test 