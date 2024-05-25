## README

The repo provides a simple example for [ztracy](https://github.com/7R35C0/ztracy) package.

Tested only with zig version 0.12.0 on Linux Fedora 39.

### 📌 About

The original implementation is here: [zig-gamedev/libs/ztracy](https://github.com/zig-gamedev/zig-gamedev/tree/main/libs/ztracy)

What I did was to create a standalone package and a release, for easier import
into another `build.zig.zon` file.

The original code for the example itself is here: [example](https://gitlab.com/zig_tracing/trace.zig/-/blob/main/examples/default_tracing_usage/src/main.zig?ref_type=heads)

### 📌 Important

🔔 The standalone package has two releases (branches):

* [ztracy-0.11.0](https://github.com/7R35C0/ztracy/releases/tag/ztracy-0.11.0) (main)
* [ztracy-tsc-0.11.0](https://github.com/7R35C0/ztracy/releases/tag/ztracy-tsc-0.11.0) (hotfix-tsc)

The first release, it is recommended for use.

However, if you get an error like:

```txt
$ zig build run
Tracy Profiler initialization failure: CPU doesn't support invariant TSC.
Define TRACY_NO_INVARIANT_CHECK=1 to ignore this error, *if you know what you are doing*.
Alternatively you may rebuild the application with the TRACY_TIMER_FALLBACK define to use lower resolution timer.
...
```

try to use the second release.

Since this issue is specific to certain computers (like mine, which is older),
the `hotfix-tsc` branch will never be merged into the `main` branch and has a
separate release.

### 📌 Useful Links

* [zig-gamedev](https://github.com/zig-gamedev/zig-gamedev.git) - main monorepo
  for @zig-gamedev libs and example applications
* [tracy](https://github.com/wolfpld/tracy) - frame profiler

That's all about this example.

All the best!
