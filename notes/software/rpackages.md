# Development of R packages

# Package structure

The basic structure of the directory is as follows:

* DESCRIPTION
* NAMESPACE
* R
* man

## DESCRIPTION

[DESCRIPTION](http://r-pkgs.had.co.nz/description.html) is the file that contains the important metadata of the package.

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

## Sources

* [Writing a package that uses Rcpp](http://dirk.eddelbuettel.com/code/rcpp/Rcpp-package.pdf)
* [R packages: Compiled code](http://r-pkgs.had.co.nz/src.html)
