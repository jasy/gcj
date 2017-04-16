#!/usr/bin/env rdmd -w -O
import std.stdio, std.string, std.conv;
import std.algorithm, std.array, std.range;
import std.parallelism;

struct IN {
};

void input(ref IN c) {
}

auto solve(IN c) {
    return format("%.6f",0.0);
}

void main() {
    auto cs = new IN[readln.chomp.to!int()];
    foreach(ref c;cs) input(c);
    foreach(i,a;taskPool.amap!solve(cs))
        writeln("Case #",i+1,": ",a);
}
