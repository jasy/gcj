#!/usr/bin/env rdmd -O
import std.stdio, std.string, std.conv;
import std.algorithm;
import core.bitop;

auto solve()
{
    auto NJ = readln.split.map!(to!int);
    immutable N=NJ[0], J=NJ[1];
    ulong[] r;
    for(ulong b=(1UL<<(N-1))+1+((N&1)?4:0); b<(1UL<<N); b+=6)
    {
        if(_popcnt(b)!=6) continue;
        r~=b;
        if(r.length>=J) return "\n"~r.map!(x=>format("%b 3 2 3 2 7 2 3 2 3",x)).join("\n");
    }
    assert(false);
}

void main()
{
    foreach(i;0..readln.chomp.to!int())
        writeln("Case #",i+1,": ",solve());
}
