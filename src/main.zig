// The original code for the example itself is here: [example](https://gitlab.com/zig_tracing/trace.zig/-/blob/main/examples/default_tracing_usage/src/main.zig?ref_type=heads)

const std = @import("std");
const print = std.debug.print;
const ztracy = @import("ztracy");
const AllocatorError = std.mem.Allocator.Error;

pub fn main() !void {
    const tracy_zone_main = ztracy.ZoneN(@src(), "zone_main");
    defer tracy_zone_main.End();

    const sum = try calculationExample();

    print("Output of the main function: {d}\n", .{sum});
}

fn calculationExample() AllocatorError!f64 {
    var prng = std.rand.DefaultPrng.init(1);
    const rand = prng.random();

    const tracy_zone_allocation = ztracy.ZoneNC(@src(), "zone_allocation", 0x00_ff_00_00);

    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    const allocator = gpa.allocator();
    defer if (gpa.deinit() == .leak) print("{s}\n", .{"memory leak"});

    const length = 1_000_000;

    var a = try std.ArrayList(f64).initCapacity(allocator, length);
    defer a.deinit();

    var b = try std.ArrayList(f64).initCapacity(allocator, length);
    defer b.deinit();

    var c = try std.ArrayList(f64).initCapacity(allocator, length);
    defer c.deinit();

    tracy_zone_allocation.End();

    const tracy_zone_array = ztracy.ZoneNC(@src(), "zone_array", 0x00_00_ff_00);

    var i: usize = 0;
    while (i < length) : (i += 1) {
        try a.append(rand.float(f64));
        try b.append(rand.float(f64));
        try c.append(0.0);
    }

    tracy_zone_array.End();

    var sum: f64 = 0.0;
    {
        const tracy_zone_calculation = ztracy.ZoneNC(@src(), "zone_calculation", 0x00_00_00_ff);
        defer tracy_zone_calculation.End();

        var index: usize = 0;
        for (c.items) |_| {
            c.items[index] = a.items[index] * b.items[index];
            index += 1;
        }

        for (c.items) |value| {
            sum += value;
        }
    }

    return sum;
}
