#!/usr/bin/env dmd -O -run
import std.stdio, std.string, std.conv;
import std.algorithm, std.array;

auto solve()
{
    auto N = readln().chomp().to!int();
    auto wn = readln().split().map!(to!real)().array().sort;
    auto wk = readln().split().map!(to!real)().array().sort;
    auto n=0, k=0;
    foreach(v;wn)
        if(wk[n]<v)
            ++n;
    foreach(v;wk)
        if(wn[k]<v)
            ++k;
    return [n,N-k].map!(to!string)().join(" ");
}

void main()
{
    foreach(i;0..readln().chomp().to!int())
        writeln("Case #",i+1,": ",solve());
}
