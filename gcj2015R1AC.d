#!/usr/bin/env rdmd -O
import std.stdio, std.string, std.conv;
import std.algorithm, std.array, std.range;
import std.math;

auto solve()
{
    immutable N = readln.chomp.to!int();
    struct P{ real x,y; }
    auto p = new P[N];
    foreach(ref v;p)
    {
        auto xy = readln.split.map!(to!int);
        v.x = xy[0];
        v.y = xy[1];
    }
    int[] r; r.reserve(N);
    foreach(i;0..N)
    {
        real[] a; a.reserve((N-1)*2);
        foreach(j;0..N) if(j!=i) 
            a ~= atan2(p[j].y-p[i].y,p[j].x-p[i].x);
        a.sort;
        foreach(v;a[0..N-1]) a ~= (v+PI*2);
        auto s = assumeSorted(a);
        int m=int.max;
        immutable real EPS = 1e-10;
        foreach(v;a[0..N-1])
            m = min(m,s.upperBound(v).lowerBound(v+(PI-EPS)).length);
        r ~= N<=1?0:m;
    }
    return r.map!(to!string).join("\n");
}

void main()
{
    foreach(i;0..readln.chomp.to!int())
        writeln("Case #",i+1,":\n",solve());
}
