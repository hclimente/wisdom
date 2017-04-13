# Rcpp

## Developing a package that uses Rcpp

Rcpp is a package that offers an easy-to-use interface between R and C++. Its core is an C++ library against which any library that makes use of this interface must be linked. (This, as well as any other used library, must appear in the *LinkingTo* field in the *DESCRIPTION*).

The basic structure of the directory is as follows:

* DESCRIPTION
* NAMESPACE
* R
  * RcppExports.R: contains the R functions that can be called.
* man
* src: the location of the C++ code.
  * files.cpp: when functions are preceded by //[[Rcpp::export]] it will be exported for its use from R.
  * RcppExports.cpp
  * Makevars: is an optional file that we need if we use other client libraries. It contains flags for the compiler and the linker:

    ```
    PKG_CPPFLAGS=-I../../src
    PKG_LIBS=-L../../cmake-build-release -lCEasyGWAS
    ```

## Sources

[Writing a package that uses Rcpp](http://dirk.eddelbuettel.com/code/rcpp/Rcpp-package.pdf)
