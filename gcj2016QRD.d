#!/usr/bin/env rdmd -O
import std.stdio, std.string, std.conv;
import std.algorithm, std.range;
import core.bitop;

auto solve()
{
    auto KCS = readln.split.map!(to!int);
    immutable K=KCS[0], C=KCS[1], S=KCS[2];
    auto n = (K+C-1)/C;
    if(n>S) return "IMPOSSIBLE";
    auto r = new ulong[n];
    int c=0;
    foreach(ref v;r) foreach(_;0..C) v*=K, v+=min(K-1,c++);
    return r.map!(v=>to!string(v+1)).join(" ");
}

void main()
{
    foreach(i;0..readln.chomp.to!int())
        writeln("Case #",i+1,": ",solve());
}
