# Vim

## Split window

Always start with `<ctrl-w>` then:

```
v (:vsplit) - vertical split 
s (:split) - horizontal split
(:sview) - split readonly

:split filename - split with another file

:q (:hide) - close
(:only) - close others

h - left
l - right
j - below
k - above

<arrows> - select window
<ctrl-w> - cycle through windows

_ - maximize current window
= - all equal size
10 <ctrl-w> + - increase 10 line

> - increase width
< - decrease width
+ - increase heigth
- - dcrease heigth
```

### Buffers

With multiple windows, we can open another buffer in a different window.

```
:ls - show current buffers
:b # - open buffer # in current window
```

## Visual Mode

### Copy selection

```
v - select
y - copy
p - paste
```


