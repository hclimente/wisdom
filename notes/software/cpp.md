# Building an executable

Building `foo` (executable or library) from the C++ source code involves three steps: preprocessing, compilation and linking.

## Preprocessing

## Compilation

## Linking

## Execution

If `foo` depends on a shared library `bar`, whenever we execute `foo`, we must be able to locate and load `bar` too.

- In Linux: `ld.so` scan different directories where to find `libbar.so` in the following order:

  1. `RPATH`. A list of directories which is linked into the executable, supported on most UNIX systems. It is ignored if `RUNPATH` is present.
  2. `LD_LIBRARY_PATH`. Environment variable which holds a list of directories.
  3. `RUNPATH`. Same as `RPATH`, but searched after `LD_LIBRARY_PATH` and not universally supported.
  4. `/etc/ld.so.conf`. Configuration file for `ld.so` which lists additional library directories.
  5. Builtin directories (/lib, /usr/lib).

- In macOS: `dyld` locates each library using the full path to each dylib, so `foo` must contain the install name for `bar`. These dependencies can be seen using `otool -L foo`.

  1. `DYLD_LIBRARY_PATH`.
  2. `RPATH`. For relocatable libraries, these directories can contain `@loader_path` and `@executable_path` (are replaced by the location of `foo`) and `@rpath` (substituted with the RPATHs in `foo`).
  3. Builtin directories (`/lib`, `/usr/lib`).
  4. `DYLD_FALLBACK_LIBRARY_PATH`.

# Resources

## Get symbols of an object file

Use gnu [nm](https://sourceware.org/binutils/docs/binutils/nm.html) to examine the object (\*.o, library, etc.):

```
nm libgin.a
```

Output:

- Symbol value
- Symbol type. Uppercase for global, lowercase for local. The most frequent are
  - t/T: symbol in the text (code) section.
  - U: symbol undefined.

# A workflow for LLDB

Being inexpert in LLDB, this is the workflow I follow to debug my R packages after they crash.

1. Run the command that causes the crash, and stop there.
2. Do a backtrace with `bt` to find out where are we in the code.
3. Go to the frame in the stack that you want to examine. For example, for frame \#14, `frame select 14`.
4. Examine variables with `po VARIABLENAME`.
5. ????
6. PROFIT!!!

# Sources

* [RPATH and CMake](https://cmake.org/Wiki/CMake_RPATH_handling)
* [stackoverflow: How does the compilation/linking process work?](https://stackoverflow.com/questions/6264249/how-does-the-compilation-linking-process-work)
