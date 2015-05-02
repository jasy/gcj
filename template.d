#!/usr/bin/env rdmd -O
import std.stdio, std.string, std.conv;

auto solve()
{
    return format("%.6f",0.0);
}

void main()
{
    foreach(i;0..readln.chomp.to!int())
        writeln("Case #",i+1,": ",solve());
}
