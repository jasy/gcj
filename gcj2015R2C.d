#!/usr/bin/env rdmd -O
import std.stdio, std.string, std.conv;
import std.algorithm, std.array, std.range;

auto solve()
{
    immutable N = readln.chomp.to!int();
    auto ss = new int[][N];
    int c=0;
    {
        int[string] dic;
        foreach(ref s;ss)
        {
            foreach(w;readln.split())
            {
                if(w !in dic) dic[w] = c++;
                s ~= dic[w];
            }
        }
    }
    if(N>20) return -1;
    auto m=int.max;
    auto ws_ = new ubyte[c];
    foreach(i;0..2) foreach(w;ss[i]) ws_[w] |= i+1;
    foreach(b;0..1u<<(N-2))
    {
        auto ws = ws_.dup;
        foreach(i;2..N)
        {
            immutable ubyte a = (b>>(i-2)&1)+1;
            foreach(w;ss[i]) ws[w] |= a;
        }
        int n=0;
        foreach(v;ws) if(v==3) ++n;
        m = min(m,n);
    }
    return m;
}

void main()
{
    foreach(i;0..readln.chomp.to!int())
        writeln("Case #",i+1,": ",solve());
}
