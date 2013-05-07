#!/usr/bin/env dmd -O -run
import std.stdio, std.string, std.conv;
import std.algorithm;
import std.file;

int[char][] trie;

static this()
{
    trie.length=1;
    foreach(w;readText("garbled_email_dictionary.txt").split())
    {
        auto cur = 0;
        foreach(c;w)
        {
            if(c !in trie[cur])
                trie[cur][c] = trie.length++.to!int();
            cur = trie[cur][c];
        }
        trie[cur]['\0'] = 0;
    }
}

auto solve()
{
    enum D = 5;
    auto S = readln().chomp();
    auto dp = new int[int][D];
    dp[0][0]=0;
    foreach(c;S)
    {
        auto dpn = new int[int][D];
        foreach(j,v;dp)
        {
            foreach(cur,mdf;v)
            {
                foreach(nc,ncur;trie[cur])
                {
                    if('\0'==nc) continue;
                    auto m = mdf;
                    auto nj = j>0? j.to!int()-1: 0;
                    if(nc!=c)
                        if(j>0)
                            continue;
                        else
                            ++m,nj=D-1;
                    void reg(int nj, int ncur, int m)
                    {
                        if(ncur in dpn[nj])
                            dpn[nj][ncur] = min(dpn[nj][ncur],m);
                        else
                            dpn[nj][ncur] = m;
                    }
                    if('\0' in trie[ncur])
                        reg(nj,0,m);
                    reg(nj,ncur,m);
                }
            }
        }
        dp.swap(dpn);
    }
    return dp.map!(x=>0 in x? x[0]: int.max).reduce!(min);
}

void main()
{
    foreach(i;0..readln().chomp().to!int())
        writeln("Case #",i+1,": ",solve());
}
