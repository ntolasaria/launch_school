

```ruby
proc1 = Proc.new { puts "#{name}" }

# name = "Charlie"

def name
  "Ruby"
end

proc1.call
```

https://launchschool.com/posts/281eea2f

ruby identifies method definitions, knows it exists before execution
but it doesnt allow them to be invoked unless that part of the program executes
