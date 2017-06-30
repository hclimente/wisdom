# Rcpp

Rcpp is a package that offers an easy-to-use interface between R and C/C++. Its core is an C++ library against which any library that makes use of this interface must be linked. (This, as well as any other used library, must appear in the *LinkingTo* field in the *DESCRIPTION*).

# Package structure

The basic structure of the directory is as follows:

* DESCRIPTION
* NAMESPACE
* R
  * RcppExports.R: contains the R functions that can be called.
* man
* src: the location of the C++ code.
  * files.cpp: when functions are preceded by //[[Rcpp::export]] it will be exported for its use from R.
  * RcppExports.cpp
  * Makevars

## DESCRIPTION

[DESCRIPTION](http://r-pkgs.had.co.nz/description.html) is the file that contains the important metadata of the package.

## Makevars

`Makevars` is an optional file that overrides the default R Makefile. It might be necessary, for example, if we use external libraries. It contains flags for the compiler and the linker:

* `PKG_LIBS`: linker flags (e.g. `PKG_LIBS=-LLIBRARY/build/release -lLIBRARY`).
* `PKG_CPPFLAGS`: pre-processor flags (e.g. include directories `PKG_CPPFLAGS=-ILIBRARY/include`).
* `PKG_CFLAGS` & `PKG_CXXFLAGS`: C and C++ flags.

# Debugging

We can interactively debug the C/C++ code through the following steps:

1. Start R, specifying the debugger (e.g. `R --debugger=lldb` if we compiled with clang or `R --debugger=gdb` if we compiled with gcc). This will open the debugger.
2. Start R by typing `process start` (lldb) or `run` (gdb).
3. Load your library normally, and execute the code that causes the crash. Now, when it occurs, the interactive debugger will be prompted.

## Sources

* [Writing a package that uses Rcpp](http://dirk.eddelbuettel.com/code/rcpp/Rcpp-package.pdf)
* [R packages: Compiled code](http://r-pkgs.had.co.nz/src.html)
