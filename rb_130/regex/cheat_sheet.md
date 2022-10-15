Conclusion

Overview

With the skills you've learned from this book, you're ready to begin using regex. Whenever you process strings or test, parse, and modify their content, you may find that regex will help. Take these opportunities to think about the problem, and decide whether a regex may help you do the job.

In this book, we've discussed the primary building blocks of regex, patterns, and have discussed the patterns you'll use most often. We've also learned some fundamental concepts:

Patterns are the building blocks of regex. You construct regex from patterns using concatenation and alternation. You then place the resulting pattern between two / characters.
Concatenation and alternation of two patterns create a new pattern.
The most basic patterns match a single character, a range of characters, or a set of characters.
We call some special characters meta-characters; they have special meaning inside a regex. When you must match one literally, escape it with a leading \ character.
Character class patterns match any character in a set or range of characters or any combination of sets and ranges.
Anchors force a regex to match at a specific location inside a string.
A quantifier matches a pattern multiple times; they always apply to the pattern to the left of the quantifier. Quantifiers are greedy by default, but also have lazy forms.
Parentheses let you combine patterns as a series of alternates. They also provide a way to capture parts of a match for later reuse; when used this way, we call the groups capture groups. We can access captured values with backreferences.
We've also learned a bit about using regex in a Ruby or JavaScript program. We learned how to test a string against a regex; how to split strings into multiple items using regex; and how to construct new strings from existing strings by using regex to extract the info we need.

Cheat Sheet

In the following tables, unescaped a, b, and z characters denote regular characters (letters, digits, punctuation), while unescaped p and q characters indicate patterns (each pattern may be arbitrarily complex). Other characters are literals.

Basic Matching

Pattern	Meaning
/a/	Match the character a
/\?/, /\./	Match a meta-character literally
/\n/, /\t/	Match a control character (newline, tab, etc)
/pq/	Concatenation (p followed by q)
/(p)/	Capture Group
/(p|q)/	Alternation (p or q)
/p/i	Case insensitive match
Character Classes and Shortcuts

Pattern	Meaning
/[ab]/	a or b
/[a-z]/	a through z, inclusive
/[^ab]/	Not (a or b)
/[^a-z]/	Not (a through z)
/./	Any character except newline
/\s/, /[\s]/	Whitespace character (space, tab, newline, etc)
/\S/, /[\S]/	Not a whitespace character
/\d/, /[\d]/	Decimal digit (0-9)
/\D/, /[\D]/	Not a decimal digit
/\w/, /[\w]/	Word character (0-9, a-z, A-Z, _)
/\W/, /[\W]/	Not a word character
Anchors

Pattern	Meaning
/^p/	Pattern at start of line
/p$/	Pattern at end of line
/\Ap/	Pattern at start of string
/p\z/	Pattern at end of string (after newline)
/p\Z/	Pattern at end of string (before newline)
/\bp/	Pattern begins at word boundary
/p\b/	Pattern ends at word boundary
/\Bp/	Pattern begins at non-word boundary
/p\B/	Pattern ends at non-word boundary
Quantifiers

Pattern	Meaning
/p*/	0 or more occurrences of pattern
/p+/	1 or more occurrences of pattern
/p?/	0 or 1 occurrence of pattern
/p{m}/	m occurrences of pattern
/p{m,}/	m or more occurrences of pattern
/p{m,n}/	m through n occurrences of pattern
/p*?/	0 or more occurrences (lazy)
/p+?/	1 or more occurrences (lazy)
/p??/	0 or 1 occurrence (lazy)
/p{m,}?/	m or more occurrences (lazy)
/p{m,n}?/	m through n occurrences (lazy)
Meta-characters

Outside Character Classes	Inside Character Classes
`$ ^ * + ? . ( ) [ ] { }	\ /`
Common Ruby Methods for Regex

Method	Use
String#match	Determine if regex matches a string
string =~ regex	Determine if regex matches a string
String#split	Split string by regex
String#sub	Replace regex match one time
String#gsub	Replace regex match globally
Common JavaScript Functions for Regex

Method	Use
String.match	Determine if regex matches a string
String.split	Split string by regex
String.replace	Replace regex match
Variants

Regex have variants; though most have similarities to each other, the different engines also have noticeable differences. For instance, Ruby supports the \A and \z anchors, while JavaScript does not.

Other languages besides Ruby and JavaScript support regex: Perl, Python, PHP, Awk, C/C++, Java, and more all provide varying levels of support for regex. Even editors like vim, emacs, and Sublime Text, as well as command line tools like sed and grep use regex. Nearly every language and program has a slightly different take on regex, though.

Every regex engine should support the following features:

basic single character matches, e.g., /a/.
concatenation, e.g., /pq/.
meta-characters escapes, e.g., /\*/.
character classes, e.g., /[abc]/ and /[a-m]/.
* quantifiers, e.g., /a*/.
. matches any character except a newline.
^ and $ line anchors
Other regex engines may not support some of the features we discussed. For instance, \A, \z and \Z aren't available with most older engines. Some features may require escapes to designate meta-characters (the convention today is that we use escapes when we want to match literals). In Ruby and JavaScript, for example, you can use /(p|q)/ for alternation, but in vim's default mode, you must use /\(p\|q\)/ instead.

Some programs even let you specify the engine you want to use. Typically, you have a choice between basic (the default), extended, and POSIX engines. You often find this choice with modern versions of ancient programs like awk, sed, and grep.

Most modern programs cover all or most of the features we have discussed, perhaps with slight variations and various levels of custom enhancements.

Resources

While this book covers almost everything you need to get started with regex, it doesn't pretend to be a reference or complete. There is much more to even the most basic implementations, so read the documentation. Familiarize yourself with the features that your regex engine supports, but don't try to memorize them; that sometimes encourages overuse of regex and the construction of regex with too much complexity. When you find that you need a feature, go ahead and look it up.

Your first place for information should be the documentation for your language's regex implementation. Since regex engines differ, sometimes considerably, ensure you're using the right information. The documentation is the best insurance against misunderstandings.

Despite the engine differences, most have a common subset of features and work in the same general way. Thus, most online discussions of regex are useful regardless of which language you use. Don't avoid sites because they use the wrong engine. Here are a few sites that may be useful:

Essential Guide To Regular Expressions: Tools and Tutorials
Regular-Expressions.info
Regex Tutorial—From Regex 101 to Advanced Regex
And don't forget about Rubular and Scriptular as well!

Developers frequently recommend two books as good regex resources:

Introducing Regular Expressions
Mastering Regular Expressions
The former is a thorough introduction to regex and how to use them. It even covers advanced regex features, such as look-ahead and look-behind assertions. The latter assumes that you are familiar with the basics of regex, and takes you out to the deep waters where you can explore, in excruciating technical detail, nearly every facet of regex and their implementations.

Where To Go From Here

Congratulations! You've made your first dive into the regex ocean, and returned to shore, unharmed. You should have a good grasp on how to construct regex, and how to employ them in your programs. At the same time, you may be a little doubtful of how much you remember. Fear not. It takes time and practice to learn how to use regex. The more you use them, the less difficulty you will have using them, and the more opportunities you'll find to use them. Skillful use of regex can make for concise, easy-to-read and easy-and-understand programs.

However, don't get carried away; a regex packs a lot of meaning into a small area and can be challenging to understand six months after you write it. If you think a regex that you are writing may be too hard to understand, you may be right. Take a step back and see if you can simplify the problem; sometimes, for instance, it's better to write multiple regex than to write one large one.

Don't forget to use Rubular and Scriptular; these two sites are incredibly useful when constructing regex. By giving them appropriate test data, you can play with and fine-tune your regex until it does what you want it to do.

Above all, keep practicing!