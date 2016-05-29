#!/usr/bin/env rdmd -O
import std.stdio, std.string, std.conv;

auto solve()
{
    immutable N = readln.chomp.to!ulong();
    if(N==0) return "INSOMNIA";
    uint b=0;
    immutable B = 10;
    ulong p = 0;
    while(b!=((1u<<B)-1))
    {
        auto n = p+N;
        p=n;
        while(n!=0)
        {
            auto d=n%B;
            n/=B;
            b|=1<<d;
        }
    }
    return p.to!string();
}

void main()
{
    foreach(i;0..readln.chomp.to!int())
        writeln("Case #",i+1,": ",solve());
}
