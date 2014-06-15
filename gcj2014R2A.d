#!/usr/bin/env rdmd -O
import std.stdio, std.string, std.conv;
import std.algorithm, std.array;

auto solve()
{
    auto NX = readln().split().map!(to!int)();
    immutable auto N=NX[0], X=NX[1];
    immutable auto S = readln().split().map!(to!int)().array().sort.idup;
    int c=0;
    int n=N-1;
    for(int i=0; i<n; ++i)
    {
        while(i<n && S[i]+S[n]>X) --n;
        if(i<n && S[i]+S[n]<=X)
            ++c,--n;
    }
    return N-c;
}

void main()
{
    foreach(i;0..readln().chomp().to!int())
        writeln("Case #",i+1,": ",solve());
}
