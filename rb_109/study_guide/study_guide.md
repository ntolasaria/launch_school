
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
  Since, the block parameter has the same name as a local variable outside the block, being variable `n`, variable shadowing takes place and prevents access to the local variable within the block. 
  The `puts n` will use the block parameter and disregard the outer scoped local variable. Variable shadowing also prevents changes from being made to the outer scoped variable `n`.

- a method definition can't access local variables in another scope.
- a method definition can access objects passed in as an argument. The object passed in gets assigned to the method parameter and is thus made available to the method body as a local variable.
- if local variable and method share the same name, 
Ruby first searches for the local variable and if it is not found then Ruby tries to find a method with the given name. Ambiguity can be avoided by adding a set of empty argument parentheses with the method invocation.
- scoping rules for method invocation with a block remain in full effect even if working inside a method definition.
- CONSTANTS have different scoping rules. They behave like globals. CONSTANTS initialized within a block will be avaiable outside the scope of the block.



2. **mutating vs non-mutating methods, pass-by-reference vs pass-by-value**
   
  Points to note
  
***pass-by-reference vs pass-by-value :***
  - Ruby behaves like pass-by-value at times, like re-assigning the object within the method doesn't affect the object outside the method. Example :
    ```ruby
    def change_name(name)
      name = 'bob'      # does this reassignment change the   object outside the method?
    end

    name = 'jim'
    change_name(name)
    puts name           # => jim

    ```

   - Ruby behaves like pass-by-reference at times. Example :
   ```ruby
    def cap(str)
      str.capitalize!   # does this affect the object outside the method?
    end
    
    name = "jim"
    cap(name)
    puts name           # => Jim

  ```


  The above code implies that Ruby is "pass byreference" as operations wthin the method affectedthe original object. This would not happen if themethod `capitalize` was used instead of`capitalize!`. 
- Basically, Ruby exhibits a combination of both. **"When an operation within the method mutates the caller, it will, it will affect the original object"** 
  
***mutating vs non-mutating methods***

  ```ruby
  a = [1, 2, 3]

  # Example of a method definition that mutates its   argument permanently
  def mutate(array)
    array.pop
  end

  p "Before mutate method: #{a}" # => [1, 2, 3] 
  mutate(a)
  p "After mutate method: #{a}" # => [1, 2]
  ```

The above code permanently modified the array that local variable `a` references by passing it to the mutate method, even though `a` is outside the method definition's scope. This is because the `pop` method mutates the caller (the array referenced by `array`). `a` is still pointing to the same array, but in this case, the array has changed, more precisely the number of elements in the array has chnaged. 

The same code with a non-mutating method like `last` would not mutate the caller and hence would not change the array being referenced by `a`.


3. working with collections (Array, Hash, String), and popular collection methods (each, map, select, etc). Review the two lessons on these topics thoroughly.
  **study RB 101 - lesson_4 part 2, 7, 8, 9.**
  
4. variables as pointers
5. puts vs return
6. false vs nil and the idea of "truthiness"
7. method definition and method invocation
8. implicit return value of method invocations and blocks
9.  how the Array#sort method works


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