#!/usr/bin/env rdmd -O
import std.stdio, std.string, std.conv;
import std.algorithm, std.array, std.typecons;

auto solve()
{
    immutable auto N = readln().chomp().to!int();
    auto G = new int[][N];
    foreach(_;1..N)
    {
        auto m = readln().split().map!(to!int);
        auto a=m[0]-1, b=m[1]-1;
        G[a]~=b;
        G[b]~=a;
    }
    int n = int.max;
    foreach(i;0..N)
    {
        alias Tuple!(int,"a",int,"d") T;
        T dfs(int p, int c)
        {
            T[] t;
            int d=0;
            foreach(v; G[c])
                if(v!=p)
                    t~=dfs(c,v), d+=t[$-1].d;
            switch(t.length)
            {
            case 0,1: return T(d,d+1);
            default:
                auto a = t.map!("a.a-a.d").array().sort;
                return T(d+a[0]+a[1],d+1);
            }
        }
        n = min(n,dfs(-1,i).a);
    }
    return n;
}

void main()
{
    foreach(i;0..readln().chomp().to!int())
        writeln("Case #",i+1,": ",solve());
}
