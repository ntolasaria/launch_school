# Introduction to REGEX

Any pattern with `/` `/`.

`/cat/` matches `cat`, `scat`, `catalog` etc. wherever the characters `c` , `a` and `t` are in continuation.

Can be used for special characters as well

like - `.,'/\-+?&%${}[]()` etc.
However, many of these have special meaning in regex, they are called meta characteres and hence must be used with escape character `\`

Example - 

`/?/` doesn't match with `'What's up?` as `?` is a meta character

However, `/\?/` does match with `'What's up?'`.

Regex is case sensitive

## Concatenation 

Everything is considered a pattern in regex, for example `cat` is a pattern made out of concatenation of three patterns `c`, `a`, and `t`. This is the fundamental of regex and it matches any string that contains `c` followed by and `a` followed by a `t`

Patterns are the building blocks of regex, not characters

Regex can get really complicated, should be refactored and made simpler. It must be used not because it is known but because the problem really requires it.

## Alternation

Its a way to constuct a regex that matches one of the several sub patterns separated by pipe `|` characters and then surround the entire expression in parantheses.

Example 

`/(cat|dog|rabit)/` - looks for `cat` or `dog` or `rabbit`. Even though `()` and `|` are meta characters they don't require escaping as we are not performing a literal match but are instead using the meta meaning of those characters.

If we escape the characters like - 

`/\(cat\|dog\)/` -> looks for `(cat|dog)` and doent treat them as an alternation operation.

## Control Character Escapes

Control character escpaes are used in strings to represent characters that don't have a visual representation. 

`\n` -> line feed / new line
`\r` -> carriage return
`\t` -> tab
.... and several more

Not everything that looks like a control character escape is a genuine control character escape.

## Ignoring Case

Appending `i` to the close `/` of a regex makes the entire regex ignore case.

`/launch/` -> looks for the string in the case mentioned
`/launch/i` -> looks for the string ignoring the case of the pattern.

