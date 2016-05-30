#!/usr/bin/env rdmd -O
import std.stdio, std.string, std.conv;
import std.algorithm;
import core.bitop;

auto solve()
{
    auto BM = readln.split;
    immutable B = BM[0].to!int();
    immutable M = BM[1].to!ulong();
    if(M>(1UL<<(B-2))) return "IMPOSSIBLE";
    auto r = new string[B+1];
    r[0]="POSSIBLE";
    if(M==(1UL<<(B-2)))
    {
        r[1]~='0';
        foreach(i;1..B)
            r[1]~='1';
    }
    else
    {
        r[1]~='0';
        foreach(i;0..B-2)
            if(M&(1UL<<(B-2-i-1))) r[1]~='1';
            else                   r[1]~='0';
        r[1]~='0';
    }
    immutable t = bsr(M);
    foreach(i;2..max(2,B-t-1))
        foreach(_;0..B)
            r[i]~='0';
    foreach(i;max(2,B-t-1)..B+1)
    {
        foreach(_;0..i) r[i]~='0';
        foreach(_;i..B) r[i]~='1';
    }
    return r.join("\n");
}

void main()
{
    foreach(i;0..readln.chomp.to!int())
        writeln("Case #",i+1,": ",solve());
}
