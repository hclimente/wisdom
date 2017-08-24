Most of people testing routine involves a interplay between writing a function and experimenting with it on the console until the desired result is achieved. In this kind of informal testing, a bunch of tests are run on the code, although no record of them is kept. In consequence, if after a couple of months we need to modify that function, it's likely that not all things are considered. In consequence, bugs that we fixed in the past must be fixed again. That's where the main power of automated tests lies: fewer bugs and code more robust. Additionally, it comes with extra perks, such as better code structure (code that's easy to test is usually better designed) and easier restarts (always finish a coding session by creating a failing test).

# The basics

> Whenever you are tempted to type something into a print statement or a debugger expression, write it as a test instead. — *Martin Fowler*

* Focus on the external interface of your functions.
* Test each behavior in only one test.
* Avoid testing simple code that you are confident you will work: focus on the complicated code, fragile code or the one you are just not that sure.
* Always write a test when you discover a bug.

# State-based testing

1. Set up the stage
2. Execute code
3. Evaluate result
4. Clean up

# Mock testing

Object-oriented languages are all about the interplay between objects. In this case, state-based testing, which is more about verifying the output for an input can be insufficient, specially when code is flaky and expensive, making failed tests difficult to analyze. Mock objects help with this. They have the same interface as the real object, but their behavior is controlled at run-time (which methods will be called? In which order? etc.). They are basically objects pre-programmed with expectations.

## C++: Google mock

Using Google mock requires including `gtest/gtest.h` and `gmock/gmock.h`. Then, we proceed in 3 steps:

1. Describe the interface we want to mock in a macro.
2. Create mock objects and specify their expectations.
3. Execute code that uses mock objects.

See a more complete explanation [here](https://github.com/google/googletest/blob/master/googlemock/docs/ForDummies.md), and the [googlemock cheatsheet](https://github.com/google/googletest/blob/master/googlemock/docs/CheatSheet.md) for an overview of the possibilities.

# References

* [R packages: tests](http://r-pkgs.had.co.nz/tests.html)
* [What Is Google C++ Mocking Framework?](https://github.com/google/googletest/blob/master/googlemock/docs/ForDummies.md)
