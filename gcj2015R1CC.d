#!/usr/bin/env rdmd -O
import std.stdio, std.string, std.conv;
import std.algorithm, std.array, std.range;
import core.bitop;

auto solve()
{
    auto cdv = readln.split.map!(to!int);
    immutable C=cdv[0], D=cdv[1], V=cdv[2];
    immutable d=readln.split.map!(to!int).array().idup;
    if(C!=1 || V>30) return -1;
    size_t u = 1;
    foreach(v;d)
        foreach_reverse(i;0..V-v+1)
            u |= (u>>i&1)<<(i+v);
    int n=0;
    while(u!=(1<<(V+1))-1)
    {
        ++n;
        auto v=bsf(~u);
        foreach_reverse(i;0..V-v+1)
            u |= (u>>i&1)<<(i+v);
    }
    return n;
}

void main()
{
    foreach(i;0..readln.chomp.to!int())
        writeln("Case #",i+1,": ",solve());
}
