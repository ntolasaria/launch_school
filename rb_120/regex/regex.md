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

`/\(cat\|dog\)/` -> looks for `(cat|dog)` and doesn't treat them as an alternation operation.

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

# Character Classes

Patterns that let you specify a set of characters that you want to match.

## Set of Characters

List of characters between square brackets, e.g. `/[abc]/`. This matches a single occurrence of any of the characters between the brackets.

This is also case sensitive, e.g. `/[Hh]oover/` matches `Hoover` or `hoover` but not `HOOVER`.

`/[abc][12]/` matches any characters where the first character is an `a`, `b` or `c` and the second is a `1` or `2`.

Meta characters fall to handful inside a character class : `^` `\` `-` `[` `]`.

## Range of Characters

`/[a-z]/` matches any lowercase alphabetic character

`/[j-p]/` limits to letters `j` through `p`

`/[0-9]/` matches any decimal digit

`/[0-9A-Fa-f]/` matches any hexadecimal digit, including upper and lowercase variants.

Never combine lowercase and uppercase alphabetic characters in a single range, like `/[A-z]/` instead use `/[A-Za-z]/`.

## Negated Classes

The first character between the brackets is a caret `^`. The negated class matches all characters not identified in the range.

`/[^aeiou]/` matches any character apart from `a`, `e`, `i`, `o`, `u`.


# Character Class Shortcuts

## Any Character

`/./` - The `.` - a meta character matches all characters apart from the new line character. It should not be put within `[]`, that would make it a literal, matching it to all the `.` instances.

## Whitespace

`\s`     - whitespace characters, includes - space `(' ')`, tab `('\t')`, vertical tab `('\v')`, carriage return `('\r')`, line feed `('\n')` and form feed `('\f')`. Thus `/\s/` is equivalent to `/[\t\v\r\n\f]/`.

`\S`    - non whitespace characters. Thus `/\S/` is equivalent to `/[^\t\v\r\n\f]/`.

Can be used in or out of `[]`

## Digits and Hex Digits

Shortcut	Meaning

`\d`  Any decimal digit (0-9)
`\D`	Any character but a decimal digit
`\h`	Any hexadecimal digit (0-9, A-F, a-f) (Ruby)
`\H`	Any character but a hexadecimal digit (Ruby)

Can be used in or out of `[]`

## Word Characters

`\w` matches word characters whereas `\W` matches non-word characters.

Word characters include all alphabetic characters `(a-z, A-Z)`, all decimal digits `(0-9)` and underscore `_`.


# Anchors

Anchors don't match any characters, thet ensure that a regex matches a string at a specific place: the beginning or end of a line, or on a word or non-word boundary.

## Start / End of Line

`^` and `$`  meta characters are anchors that fix a regex to the :

`^` - beginning of a line
`$` - ending of a line

### Lines vs Strings

```ruby
TEXT1 = "red fish\nblue fish"
puts "matched red" if TEXT1.match(/^red/)
puts "matched blue" if TEXT1.match(/^blue/)
```

Output:

`matched red`
`matched blue`

Both conditions evaluate to true since `^` anchors regex to the beginning of each line in the string, not the beginning of the string. For Ruby, each new line occurs after a `\n` character. If no more `\n` characters are available, the last line runs through to the end of the string.

For `$`
```ruby
TEXT2 = "red fish\nred shirt"
puts "matched fish" if TEXT2.match(/fish$/)
puts "matched shirt" if TEXT2.match(/shirt$/)
```

Output:

`matched fish`
`matched shirt`

Much like before. Even though the first line in the string ends with a `\n`, `fish` is still said to occur at the end of the line. `$` doesn't care if there is a `\n` character at the end provided there in no more than one.


## Start / End of String

When not required to match multi line strings. Match is required at the beginning or end of the string, not the line. For this `\A`, `\Z` and `\z` anchors should be used. (There is not `\a` anchor).

The `\A` matches a reges at the beginning of the string, while `\Z` and `\z` match at the end of the string.

`\z` - always matches at the end of the string
`\Z` - matches up to, but not inlcuding, a newline character at the end of the string. 

Use `\z` until you really need `\Z`.

```ruby
TEXT3 = "red fish\nblue fish"
TEXT4 = "red fish\nred shirt"
puts "matched red" if TEXT3.match(/\Ared/)
puts "matched blue" if TEXT3.match(/\Ablue/)
puts "matched fish" if TEXT4.match(/fish\z/)
puts "matched shirt" if TEXT4.match(/shirt\z/)
```

Output:

`matches red`
`matched shirt`

This can be seen in contrast with the previous examples where both the cases evaluated to be true, i.e., matched.

## Word Boundaries

`\b`  - word boundary
      - words are sequence of word characters `\w`
    - Word boundary occurs:
      - between any pair of characters, one of which is a word character and one which is not
      - at the beginning of a string if the first character is a word character
      - at the end of a string if the last character is a word character

`\B`  - non word boundary
      - non words are sequence of non-word characters `\W`
    - Non-word boundary occurs:
      - between any pair of characters, both of which are word characters or both of which are not word chracters.
      - at the beginning of a string if the first character is a non word character.
      - at the end of a string if the last character is a non-word character.

Example

`Eat some food.`

Here word boundaries occur before the `E`, `s` and `f` at the start of the three words, and after the `t`, `e` and `d` at their ends.

Non-word boundaries occur elsewhere, such as between `o` and `m` in `some`, and following the `.` at the end of the sentence etc.









