#!/usr/bin/env rdmd -O
import std.stdio, std.string, std.conv;
import std.algorithm, std.array, std.range;
import std.typecons;

auto solve()
{
    immutable N = readln.chomp.to!int();
    alias Tuple!(int,"D",int,"M") T;
    T[] h;
    foreach(_;0..N)
    {
        auto DHM = readln.split.map!(to!int);
        immutable D=DHM[0], H=DHM[1], M=DHM[2];
        foreach(i;0..H) h~=T(D,M+i);
    }
    if(h.length>2) return -1;
    if(h.length<2) return 0;
    if(h[0].M*(720L-h[0].D)<=h[1].M*(360L-h[1].D)) return 1;
    if(h[1].M*(720L-h[1].D)<=h[0].M*(360L-h[0].D)) return 1;
    return 0;
}

void main()
{
    foreach(i;0..readln.chomp.to!int())
        writeln("Case #",i+1,": ",solve());
}
