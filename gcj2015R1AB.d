#!/usr/bin/env rdmd -O
import std.stdio, std.string, std.conv;
import std.algorithm, std.array, std.range;

auto solve()
{
    auto bn = readln.split.map!(to!int);
    immutable B=bn[0], N=bn[1];
    immutable M = readln.split.map!(to!int).array().idup;
    long lo=-1, hi=long.max/2;
    int k;
    while(lo+1<hi)
    {
        auto mi = (lo+hi+1)/2;
        long c=0;
        int[] n;
        foreach(i;0..B)
        {
            auto v = mi/M[i]+1;
            if(c>long.max-v){ c=long.max; break; }
            c += v;
            if(mi%M[i]==0) n~=i;
        }
        if(c>=N)
        {
            hi = mi;
            if(c-N+1<=n.length)
                k=n[$-(c-N+1)];
        }
        else
        {
            lo = mi;
        }
    }
    return k+1;
}

void main()
{
    foreach(i;0..readln.chomp.to!int())
        writeln("Case #",i+1,": ",solve());
}
