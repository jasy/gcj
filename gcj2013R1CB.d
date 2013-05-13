#!/usr/bin/env dmd -O -run
import std.stdio, std.string, std.conv;
import std.algorithm;
import std.math;

auto solve()
{
    auto XY = readln().split().map!(to!int);
    auto X = XY[0];
    auto Y = XY[1];
    long n = 0;
    {
        auto A = X.abs() + Y.abs();
        long s=0;
        while(s<A || A%2!=s%2)
            ++n,s=n*(n+1)/2;
    }
    auto r = new char[n];
    foreach_reverse(i;0..n)
    {
        if(X.abs()>Y.abs())
            if(X>0) X-=i+1,r[i]='E';
            else    X+=i+1,r[i]='W';
        else
            if(Y>0) Y-=i+1,r[i]='N';
            else    Y+=i+1,r[i]='S';
    }
    return r;
}

void main()
{
    foreach(i;0..readln().chomp().to!int())
        writeln("Case #",i+1,": ",solve());
}
