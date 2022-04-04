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

##