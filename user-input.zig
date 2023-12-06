const std = @import("std");

pub fn main() !void {
    var allocator = std.heap.page_allocator();
    defer allocator.freeAll();

    const stdout = std.io.getStdOut().writer();
    try stdout.print("Enter your name: ", .{});

    const name = try std.io.getStdIn().readLineAlloc(allocator, 1000, true);
    defer allocator.free(name);

    try stdout.print("Hello, {s}\n", .{name[0 .. name.len - 1]});
}
