#!/usr/bin/env rdmd -O
import std.stdio, std.string, std.conv;
import std.algorithm, std.array, std.range;

auto solve()
{
    immutable IMPOSSIBLE = "IMPOSSIBLE";
    auto nvx = readln.split;
    immutable N=nvx[0].to!int();
    immutable V=nvx[1].to!real(), X=nvx[2].to!real();
    auto rc = new real[2][N];
    foreach(ref v;rc) v = readln.split.map!(to!real).array();
    if(N>2) return "-1";
    real t=0;
    if(N==0) assert(false);
    if(N==1)
    {
        if(rc[0][1]!=X) return IMPOSSIBLE;
        t = V/rc[0][0];
    }
    else
    {
        auto r0=rc[0][0], r1=rc[1][0];
        auto c0=rc[0][1], c1=rc[1][1];
        if(c0>c1) swap(r0,r1),swap(c0,c1);
        if(X<c0 || c1<X) return IMPOSSIBLE;
        if(c0==c1)
        {
            t = V/(r0+r1);
        }
        else
        {
            immutable d0=X-c0, d1=c1-X;
            t = max(V*d1/(d0+d1)/r0,V*d0/(d0+d1)/r1);
        }
    }
    return format("%.9f",t);
}

void main()
{
    foreach(i;0..readln.chomp.to!int())
        writeln("Case #",i+1,": ",solve());
}
