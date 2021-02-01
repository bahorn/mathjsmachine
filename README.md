# MathJS Abstract Machine

So, I was revising for my programming language theory exam, and I found out
Pancake (the discord bot) uses mathjs.

MathJS provides a few nice features that lets us create an abstract machine, so
we can basically use it as a programming environment.

Useful features such as:

* Variable Assignment: `a = 2`
* Functions: `f(x) = x ^ 2` (along with recursion!)
* Sequences of instructions: `a=2;b=2;b`
* Conditionals: `s ? s1 : s2`

Also, we have support for various types like strings, integers, complex numbers,
lists and a few more!

All of this is enough to be turing complete (ignoring the resource limits, which
stop the fun from getting out of hand).

So for example, if we wanted to write a function to calculate the factorial of a
number, we can write something like:

`f(x) = x>0 ? x*f(x-1) : 1; f(10)`

Is there any point in this? Probably not. Best idea i could come up with was
programs that users can send to some stupid thing, like a luck game or
something.
