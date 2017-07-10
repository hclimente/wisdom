Most of people testing routine involves a interplay between writing a function and experimenting with it on the console until the desired result is achieved. In this kind of informal testing, a bunch of tests are run on the code, although no record of them is kept. In consequence, if after a couple of months we need to modify that function, it's likely that not all things are considered. In consequence, bugs that we fixed in the past must be fixed again. That's where the main power of automated tests lies: fewer bugs and code more robust. Additionally, it comes with extra perks, such as better code structure (code that's easy to test is usually better designed) and easier restarts (always finish a coding session by creating a failing test).

## The basics

> Whenever you are tempted to type something into a print statement or a debugger expression, write it as a test instead. — *Martin Fowler*

* Focus on the external interface of your functions.
* Test each behavior in only one test.
* Avoid testing simple code that you are confident you will work: focus on the complicated code, fragile code or the one you are just not that sure.
* Always write a test when you discover a bug.

# References

* [R packages: tests](http://r-pkgs.had.co.nz/tests.html)
