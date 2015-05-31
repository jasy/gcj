#!/usr/bin/env rdmd -O
import std.stdio, std.string, std.conv;
import std.algorithm, std.array, std.range;

auto solve()
{
    auto rc = readln.split.map!(to!int);
    immutable R=rc[0], C=rc[1];
    string[] g;
    foreach(i;0..R) g~=readln.chomp;
    auto rn = new int[](R);
    auto cn = new int[](C);
    foreach(i;0..R) foreach(j;0..C) if(g[i][j]!='.')
        ++rn[i], ++cn[j];
    int m=0;
    foreach(i;0..R) foreach(j;0..C)
    {
        immutable char d = g[i][j];
        if(d!='.')
        {
            int dx=0,dy=0;
            switch(d)
            {
            case '>': dx=1; break;
            case '<': dx=-1; break;
            case '^': dy=-1; break;
            case 'v': dy=1; break;
            default: assert(false);
            }
            bool f=false;
            for(int k=1; ; ++k)
            {
                immutable x = j+dx*k;
                immutable y = i+dy*k;
                if(x<0 || C<=x || y<0 || R<=y)
                    break;
                if(g[y][x]!='.'){ f=true; break; }
            }
            if(!f)
            {
                if(rn[i]>=2 || cn[j]>=2) ++m;
                else return "IMPOSSIBLE";
            }
        }
    }
    return m.to!string();
}

void main()
{
    foreach(i;0..readln.chomp.to!int())
        writeln("Case #",i+1,": ",solve());
}
