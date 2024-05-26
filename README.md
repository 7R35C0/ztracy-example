## README

The repo provides a simple example for [ztracy](https://github.com/7R35C0/ztracy) library.

Tested only with zig version 0.12.0 on Linux Fedora 39.

### 📌 About

The original implementation is here: [zig-gamedev/libs/ztracy](https://github.com/zig-gamedev/zig-gamedev/tree/main/libs/ztracy)

The original code for the example itself is here: [example](https://gitlab.com/zig_tracing/trace.zig/-/blob/main/examples/default_tracing_usage/src/main.zig?ref_type=heads)

### 📌 Important

🔔 The library has two repos (releases):

* [ztracy](https://github.com/7R35C0/ztracy) ( [ztracy-0.11.0](https://github.com/7R35C0/ztracy/releases/tag/ztracy-0.11.0) )
* [ztracy-tsc](https://github.com/7R35C0/ztracy-tsc) ( [ztracy-tsc-0.11.0](https://github.com/7R35C0/ztracy-tsc/releases/tag/ztracy-tsc-0.11.0) )

The recommended release to use is the first one.

However, if you get an error like:

```txt
$ zig build run
Tracy Profiler initialization failure: CPU doesn't support invariant TSC.
Define TRACY_NO_INVARIANT_CHECK=1 to ignore this error, *if you know what you are doing*.
Alternatively you may rebuild the application with the TRACY_TIMER_FALLBACK define to use lower resolution timer.
...
```

try to use the second release.

### 📌 Useful Links

* [zig-gamedev](https://github.com/zig-gamedev/zig-gamedev.git) - main monorepo
  for @zig-gamedev libs and example applications
* [tracy](https://github.com/wolfpld/tracy) - frame profiler

That's all about this example.

All the best!
