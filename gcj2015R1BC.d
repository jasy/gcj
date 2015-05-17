#!/usr/bin/env rdmd -O
import std.stdio, std.string, std.conv;
import std.algorithm, std.array, std.range;
import std.container, std.typecons;
import std.math;

auto solve()
{
    immutable N = readln.chomp.to!int();
    alias Tuple!(int,"D",int,"M") T;
    T[] h;
    foreach(_;0..N)
    {
        auto DHM = readln.split.map!(to!int);
        immutable D=DHM[0], H=DHM[1], M=DHM[2];
        foreach(i;0..H) h~=T(D,M+i);
    }
    alias Tuple!(long,"t",int,"r",int,"i") V;
    BinaryHeap!(Array!V,"a>b") q;
    foreach(int i,v;h) q.insert(V(v.M*(360L-v.D),1,i));
    ulong m = h.length, c=m;
    foreach(_;0..h.length*2)
    {
        with(q.front)
        {
            m=min(m,c+=r>0?-1:1);
            q.replaceFront(V(t+h[i].M*360L,r-1,i));
        }
    }
    return m;
}

void main()
{
    foreach(i;0..readln.chomp.to!int())
        writeln("Case #",i+1,": ",solve());
}
