#!/usr/bin/env rdmd -O
import std.stdio, std.string, std.conv;
import std.algorithm, std.array, std.range;

auto solve()
{
    auto cdv = readln.split.map!(to!long);
    immutable C=cdv[0], D=cdv[1], V=cdv[2];
    auto d=readln.split.map!(to!long).array();
    int n=0;
    for(long m=0; m<V; )
        if(d.length==0 || d.front>m+1) m+=(m+1)*C, ++n;
        else m+=d.front*C, d.popFront();
    return n;
}

void main()
{
    foreach(i;0..readln.chomp.to!int())
        writeln("Case #",i+1,": ",solve());
}
