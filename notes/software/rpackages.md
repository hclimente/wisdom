# Development of R packages

# Package structure

The basic structure of the directory is as follows:

* DESCRIPTION
* NAMESPACE
* R
* man
* vignettes

## DESCRIPTION

[DESCRIPTION](http://r-pkgs.had.co.nz/description.html) is the file that contains the important metadata of the package.

R packages listed in either `Imports` and `Depends` ensures that the package is installed. However, there is a difference: `Imports` loads the package; `Depends` attaches it. Loading a package will load the code, data and dynamic libraries, register S3 and S4 methods, and run .onLoad(); all of this without putting the package in the search path, so it will not be usable without ::. Attaching it will actually put the package in the search path. Usually packages should always be self-contained, minimizing the changes on the global environment, and hence be listed under `Imports`.

## NAMESPACE

When a function is called, R has to locate the object associated to that name. First, R searches the global environment. If unsuccessful, it checks the search path i.e. the list of all the *attached* packages.  The namespace of a package provides a context where to look for the object associated with a name. They are recorded in the [NAMESPACE](http://r-pkgs.had.co.nz/namespace.html) file. A correct organization of the NAMESPACE file will contain the package. There are two questions to consider, imports and exports:

- Imports define how a function in one package finds a function from another package.
  - export() to export functions.
  - exportPattern() to export all functions matching a pattern.
  - exportClasses() and exportMethods() to export S4 classes and methods.
  - S3method() to export S3 methods.

- Exports define which functions are available outside of a package.
  - import() to import all functions from a package.
  - importFrom() to import selected functions.
  - importClassesFrom() and importMethodsFrom() to import S4 classes and methods.
  - useDynLib() to import a function from C.

### NAMESPACE in roxygen2

Hadley recommends letting roxygen2 the trouble of writing the NAMESPACE:

- `#' @export` will export an object from our package.
- `#' @import methods`
- `##' @importFrom package function` imports a function from a package.

# Testing

For general notes on testing see [Testing](testing.md). To start your testing process in an R package, do

```{r}
devtools::use_testthat()
```

This creates the `tests/testhat` directory, where all the test files will live, always as `test*.R`. Also, the file `tests/testthat.R`, which will run all the tests. Test files group multiple related tests. To run all your test, just go

```{r}
devtools::test()
```

Example of test file from `stringr`:

```{r}
library(stringr)
context("String length") # provide a human readable name

# a test
# groups multiple expectation to test the output of a single unit of functionality.
test_that("str_length is number of characters", {
  expect_equal(str_length("a"), 1) # expectation: the atom of testing. Checks value and class match; if not, throw error.
  expect_equal(str_length("ab"), 2) # other expectation
  expect_equal(str_length("abc"), 3)
})

# other test
test_that("str_length of factor is length of level", {
  expect_equal(str_length(factor("a")), 1)
  expect_equal(str_length(factor("ab")), 2)
  expect_equal(str_length(factor("abc")), 3)
})
```

## Tests

Tests group several expectations related to a unit of functionality. The idea is that, if it fails, we will know with certain precision which part of the code might be failing.

## Expectations

Expectations have two arguments: the first one is the actual result, the second is the expected. Some common expectation functions:

  * Equality: `expect_identical()`, or `expect_equal()` for some numerical tolerance.
  * Match a `grepl()` regular expression: `expect_match()` and its variations for different types of output (`expect_output()`, `expect_message()`, `expect_warning()` and `expect_error()`).
  * Class: `expect_is()`.
  * Misc: `expect_true()`, `expect_false()`.
  * Complicated outputs: `expect_equal_to_reference()` caches the result the first time its run, and then compares it to subsequent runs.

# Rcpp

Rcpp is a package that offers an easy-to-use interface between R and C/C++. Its core is an C++ library against which any library that makes use of this interface must be linked. (This, as well as any other used library, must appear in the *LinkingTo* field in the *DESCRIPTION*).

## Package structure

A package with C++ code includes some additional file structures over a "classic" R package. Those are:

* R
  * RcppExports.R
* src: the location of the C++ code.
  * \*.cpp
  * Makevars
  * RcppExports.cpp

### R/RcppExports.R

`R/RcppExports.R` is an automatically generated file that contains the R functions that can be called.

### src/\*.cpp

C++ files are located under the src folder. By adding some tags, we control how Rcpp will handle it:

* `// [[Rcpp::export]]` preceding a function will cause it to be exported for its use in R. Note that all the functions in R must have a valid interface. For example, `data.frame` can be converted into an `eigen::MatrixXd` thanks to `RcppEigen`, but it is not the case for every R data structure.
* `// [[Rcpp::interfaces(r, cpp)]]` will include a header file in `inst/include/PACKAGE.h` that can be included by other packages.

### src/Makevars

`Makevars` is an optional file that overrides the default R Makefile. It might be necessary, for example, if we use external libraries. It contains flags for the compiler and the linker:

* `PKG_LIBS`: linker flags (e.g. `PKG_LIBS=-LLIBRARY/build/release -lLIBRARY`).
* `PKG_CPPFLAGS`: pre-processor flags (e.g. include directories `PKG_CPPFLAGS=-ILIBRARY/include`).
* `PKG_CFLAGS` & `PKG_CXXFLAGS`: C and C++ flags.

## Debugging

We can interactively debug the C/C++ code through the following steps:

1. Start R, specifying the debugger (e.g. `R --debugger=lldb` if we compiled with clang or `R --debugger=gdb` if we compiled with gcc). This will open the debugger.
2. Start R by typing `process start` (lldb) or `run` (gdb).
3. Load your library normally, and execute the code that causes the crash. Now, when it occurs, the interactive debugger will be prompted.

# References

* [Writing a package that uses Rcpp](http://dirk.eddelbuettel.com/code/rcpp/Rcpp-package.pdf)
* R packages by Hadley Wickham, specifically:
  * [Compiled code](http://r-pkgs.had.co.nz/src.html)
  * [Testing](http://r-pkgs.had.co.nz/tests.html)
  * [Vignettes](http://r-pkgs.had.co.nz/vignettes.html)
* [Jeff Leek approach to R packages philosophy and development](https://github.com/jtleek/rpackages)
