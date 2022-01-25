## Questions :

1. If there is a method call as follows :
```ruby
arr = [1, 2, 3]

arr.each do |n|
	puts n
end
```

which is the argument - `arr` or the `do..end` block or both.

Answer :

The `do..end` block is the argument. Can be written as follows :

The `each` method is called on the array being referenced by the local variable `arr` and the `do..end` block with one parameter `n` is passed as argument.


2. method call :
```ruby
string << ‘ world’
```

how to write - method `#<<` is called on the string being referenced by `string` and `” world”` is passed as an argument.

Answer :

The method `#<<` is called on string being referenced by local variable `string` and the string object `' world'` is passed as an argument.

3. example
```ruby
a = %w(a b c)
a[1] = ‘_’
p a
```
Can line 2 be written as - the method `#[]=` is called using `a[1] = ‘_’` which reassigns the element at index `1` of the array being referenced by the local variable `a` and modifies the array.

Answer :

Yes can be written. Also the method call can be written as :

```ruby
a.[]=(1, '_')
```


4. When `puts` is called on an array. It outputs the elements of the array or the array itself - which one is correct. 

Answer :

```ruby
arr = [1, 2, 3]
puts arr
```

The `puts` method is called and the local variable `arr` is passed as an argument. 

Option 1 - The elements of the array referenced by `arr` are output.

Option 2 - The array being referenced by the local variable `arr` is output.

## Other notes :

