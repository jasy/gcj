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
    alias Tuple!(long,"t",size_t,"i") V;
    BinaryHeap!(Array!V,"a>b") q;
    foreach(i,v;h) q.insert(V(v.M*(360L-v.D),i));
    ulong m = h.length;
    foreach(_;0..h.length*2)
    {
        with(q.front)
        {
            ulong c=0;
            foreach(v;h)
                c += abs(t/v.M/360 + (t/v.M%360>=(360-v.D)?0:-1));
            m=min(m,c);
            q.replaceFront(V(t+h[i].M*360L,i));
        }
    }
    return m;
}

void main()
{
    foreach(i;0..readln.chomp.to!int())
        writeln("Case #",i+1,": ",solve());
}
