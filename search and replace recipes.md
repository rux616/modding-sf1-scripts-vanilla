# search and replace recipes

## remove backslash line breaks

search:

```regex
\s*\\\n\s*
```

replace:

```regex
 
```

## remove 'EndEvent' lines

search:

```regex
\n^EndEvent[\t ]*$
```

replace:

```regex
```

## move function/event declaration above preceding ';' comments

search:

```regex
^((;.*\n)+)(\w*\[*\]* *(Function|Event).*\(.*\).*\n)
```

replace:

```regex
$3$1
```

convert functions/events of

```papyrus
; comment1 here
; comment2 here
Function foo()
```

to

```papyrus
Function foo()
; comment1 here
; comment2 here
```

## put something above the comments

search:

```regex
^((;.+\n)+)
```

replace:

```regex
; something\n$2
```

before:

```papyrus

; comment1 here
; comment2 here
Function foo()
```

after:

```papyrus

; something
; comment1 here
; comment2 here
Function foo()
```

## surround function/event/ declaration with back ticks

search:

```regex
^(\w*\[*\]* *(Function|Event).*\(.*\).*)$
```

replace:

```regex
`$1`
```

## add '###[...] Function|Event: ' headers

search:

```regex
^$\n(`\w*\[*\]* *(Function|Event).*\(.*\).*)
```

replace:

```regex
\n##### $2: \n$1
```

note: don't forget to adjust the number of '#'

## fill out function/event name in '###[...] Function|Event: [...]' headers

search:

```regex
^(##+ )(Function|Event)(: )($\n^`.+\b)(\w+)(\(.*\).*`$)
```

replace:

```regex
$1$2$3$5$4$5$6
```

## apply proper case to function headers

search:

```regex
^(##+ )(function)(: )(.*)$
```

replace:

```regex
$1Function$3$4
```

## separate comment lines

search:

```regex
^;\s*(.*)
```

replace:

```regex
\n$1
```

## reset " (Native)" and " (Global)" headers

search:

```regex
^(##+ )(Function)(: \w+).*$
```

replace:

```regex
$1$2$3
```

## add " (Native)" to function header

search:

```regex
^(##+ )(Function)(: \w+.*)(?<!\(native\))(\n`.+)(native)(.*`$)
```

replace:

```regex
$1$2$3 (Native)$4$5$6
```

## add " (Global)" to function header

search:

```regex
^(##+ )(Function)(: \w+.*)(?<!\(global\))(\n`.+)(global)(.*`$)
```

replace:

```regex
$1$2$3 (Global)$4$5$6
```

## add link to table of contents at bottom of every section

search:

```regex
(?<!\(\[TOC\].*)(\n\n###+ .*)
```

replace

```regex
\n\n([TOC](#table-of-contents))$1
```
