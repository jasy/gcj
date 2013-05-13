#!/usr/bin/env dmd -O -run
import std.stdio, std.string, std.conv;
import std.algorithm;

auto solve()
{
    auto XY = readln().split().map!(to!int);
    auto X = XY[0];
    auto Y = XY[1];
    char[] r;
    if(X!=0)
    {
        int a = X>0? X: -X;
        int d = X>0? 1: -1;
        foreach(i;0..a*2)
        {
            r ~= d>0? 'W': 'E';
            d *= -1;
        }
    }
    if(Y!=0)
    {
        int a = Y>0? Y: -Y;
        int d = Y>0? 1: -1;
        foreach(i;0..a*2)
        {
            r ~= d>0? 'S': 'N';
            d *= -1;
        }
    }
    return r;
}

void main()
{
    foreach(i;0..readln().chomp().to!int())
        writeln("Case #",i+1,": ",solve());
}
