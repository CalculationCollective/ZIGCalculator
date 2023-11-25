const std = @import("std");

pub fn main() !void {
    const stdin = std.io.getStdIn().reader();
    const stdout = std.io.getStdOut().writer();
    
    var buf_input_num1: [128]u8 = undefined;
    try stdout.print("Enter the first number: ", .{});
    const input_num1 = try stdin.readUntilDelimiterOrEof(&buf_input_num1, '\n');
    const num1 = try std.fmt.parseFloat(f64, input_num1.?);
    
    var buf_input_operator: [2]u8 = undefined;   
    try stdout.print("Choose between:\n1) Addition\n2) Subtraction\n3) Multiplication\n4) Division\n", .{});
    const input_operator = try stdin.readUntilDelimiterOrEof(&buf_input_operator, '\n');
    const operator = try std.fmt.parseInt(i8, input_operator.?, 10);
    
    var buf_input_num2: [128]u8 = undefined;
    try stdout.print("Enter the second number: ", .{});
    const input_num2 = try stdin.readUntilDelimiterOrEof(&buf_input_num2, '\n');
    const num2 = try std.fmt.parseFloat(f64, input_num2.?);
    
    switch (operator) {
            1 => std.debug.print("{d}\n", .{num1 + num2}),
            2 => std.debug.print("{d}\n", .{num1 - num2}),
            3 => std.debug.print("{d}\n", .{num1 * num2}),
            4 => std.debug.print("{d}\n", .{num1 / num2}),
            else => std.debug.print("{d} is not a valid function\n", .{operator}),
    }
}