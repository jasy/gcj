#!/usr/bin/env rdmd -O
import std.stdio, std.string, std.conv;
import std.algorithm, std.array, std.range;

auto solve()
{
    auto rcw = readln.split.map!(to!int);
    immutable R=rcw[0], C=rcw[1], W=rcw[2];
    return C/W*(R-1)+(C+W-1)/W+W-1;
}

void main()
{
    foreach(i;0..readln.chomp.to!int())
        writeln("Case #",i+1,": ",solve());
}
