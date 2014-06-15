#!/usr/bin/env rdmd -O
import std.stdio, std.string, std.conv;
import std.algorithm, std.array;

long gcd(long a, long b)
{
    while(b!=0)
        a%=b,swap(a,b);
    return a;
}

auto solve()
{
    auto m = readln().split("/").map!(chomp)().map!(to!long)();
    immutable auto P=m[0], Q=m[1];
    immutable auto g = gcd(P,Q);
    immutable auto p=P/g, q=Q/g;
    if((q&q-1)!=0)
        return "impossible";
    foreach(i;0..40)
        if((1UL<<i)==q)
        {
            foreach(j;0..i+1)
                if(p>=(1UL<<(i-j)))
                    return j.to!string();
        }
    return "impossible";
}

void main()
{
    foreach(i;0..readln().chomp().to!int())
        writeln("Case #",i+1,": ",solve());
}
