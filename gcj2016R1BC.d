#!/usr/bin/env rdmd -O
import std.stdio, std.string, std.conv;
import std.algorithm, std.array;
import core.bitop;

auto solve()
{
    immutable N = readln.chomp.to!int();
    auto topics = new string[2][N];
    foreach(ref a;topics) a=readln.split.array();
    int m=0;
    foreach(b;0..1<<N)
    {
        bool f=false;
        bool[string] words1;
        bool[string] words2;
        foreach(i,ref a;topics) if(!(b>>i&1))
        {
            words1[a[0]]=true;
            words2[a[1]]=true;
        }
        foreach(i,ref a;topics) if(b>>i&1)
        {
            f = a[0] !in words1 || a[1] !in words2;
            if(f) break;
        }
        if(f) continue;
        m=max(m,_popcnt(b));
    }
    return m;
}

void main()
{
    foreach(i;0..readln.chomp.to!int())
        writeln("Case #",i+1,": ",solve());
}
