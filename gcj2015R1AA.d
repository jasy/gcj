#!/usr/bin/env rdmd -O
import std.stdio, std.string, std.conv;
import std.algorithm, std.array, std.range;

auto solve()
{
    immutable N = readln.chomp.to!int();
    immutable m = readln.split.map!(to!int).array().idup;
    long y = 0;
    foreach(i;1..N) y += max(0,m[i-1]-m[i]);
    long d = 0;
    foreach(i;1..N) d = max(d,max(0,m[i-1]-m[i]));
    long z = 0;
    foreach(i;1..N) z += min(d,m[i-1]);
    return [y,z].map!(to!string).join(" ");
}

void main()
{
    foreach(i;0..readln.chomp.to!int())
        writeln("Case #",i+1,": ",solve());
}
