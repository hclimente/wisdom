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
