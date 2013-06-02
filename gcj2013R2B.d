#!/usr/bin/env dmd -O -run
import std.stdio, std.string, std.conv;
import std.algorithm, std.array;
import std.bigint;
import std.container, std.typecons;

auto solve_g(long N, long P)
{
    auto team = 1L<<N;
    auto l=0L, r=team;
    while(l<r-1)
    {
        auto m = (l+r)/2;
        auto u = m;
        auto n = 0;
        while(u>0)
            u=(u-1)/2,++n;
        auto score = team - (1L<<(N-n));
        if(score<P)
            l=m;
        else
            r=m;
    }
    return l;
}

auto solve_c(long N, long P)
{
    auto team = 1L<<N;
    auto l=0L, r=team;
    while(l<r-1)
    {
        auto m = (l+r)/2;
        auto u = team-m-1;
        auto n = 0;
        while(u>0)
            u=(u-1)/2,++n;
        auto score = 1L<<(N-n);
        if(score<=P)
            l=m;
        else
            r=m;
    }
    return l;
}

auto solve()
{
    auto NP = readln().split().map!(to!long);
    auto N = NP[0], P = NP[1];
    auto team = 1L<<N;
    return [solve_g(N,P),solve_c(N,P)].map!(to!string).join(" ");
}

void main()
{
    foreach(i;0..readln().chomp().to!int())
        writeln("Case #",i+1,": ",solve());
}
