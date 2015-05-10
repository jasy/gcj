#!/usr/bin/env rdmd -O
import std.stdio, std.string, std.conv;
import std.algorithm, std.array, std.range;

auto solve()
{
    auto kls = readln.split.map!(to!int);
    immutable K=kls[0], L=kls[1], S=kls[2];
    immutable KS = readln.chomp;
    immutable LS = readln.chomp;
    auto ks = new char[S];
    int n=0,m=0;
    foreach(b_;0..K^^S)
    {
        auto b=b_;
        foreach_reverse(ref k;ks) k=KS[b%K],b/=K;
        int c=0;
        foreach(i;0..S-L+1) if(ks[i..i+L]==LS) ++c;
        m=max(m,c);
        n+=c;
    }
    return format("%.7f",m-n*1.0/K^^S);
}

void main()
{
    foreach(i;0..readln.chomp.to!int())
        writeln("Case #",i+1,": ",solve());
}
