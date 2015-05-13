#!/usr/bin/env rdmd -O
import std.stdio, std.string, std.conv;
import std.algorithm, std.array, std.range;

auto solve()
{
    auto kls = readln.split.map!(to!int);
    immutable K=kls[0], L=kls[1], S=kls[2];
    immutable KS = readln.chomp;
    immutable LS = readln.chomp;
    int[26] kn;
    foreach(c;KS) ++kn[c-'A'];
    real p=0;
    if(LS.all!(c=>kn[c-'A']!=0))
    {
        p=S-L+1;
        foreach(c;LS) p=p*kn[c-'A']/K;
        int m=0;
        foreach(i;1..L) if(LS[0..i]==LS[$-i..$]) m=i;
        p = (S-L)/(L-m)+1 - p;
    }
    return format("%.7f",p);
}

void main()
{
    foreach(i;0..readln.chomp.to!int())
        writeln("Case #",i+1,": ",solve());
}
