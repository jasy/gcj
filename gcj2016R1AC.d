#!/usr/bin/env rdmd -O
import std.stdio, std.string, std.conv;
import std.algorithm, std.array, std.range;

auto solve()
{
    immutable N = readln.chomp.to!int();
    immutable F = readln.split.map!(x=>x.to!int()-1).array();
    int c=0;
    auto b = new bool[N];
    {
        auto G = new int[][N];
        foreach(i;0..N) G[F[i]]~=i;
        foreach(i;0..N)
        {
            immutable s=F[i];
            if(b[i] || i!=F[s]) continue;
            int dfs2(int j)
            {
                b[j]=true;
                int e=0;
                foreach(k;G[j]) if(k!=i && k!=s)
                    e=max(e,dfs2(k));
                return e+1;
            }
            c += dfs2(i)+dfs2(s);
        }
    }
    {
        auto m=new int[N];
        int dfs(int i, int s, int r)
        {
            if(m[i]!=0) return r-m[i];
            m[i]=r;
            return dfs(F[i],i,r+1);
        }
        foreach(i;0..N) if(!b[i])
        {
            m[]=0;
            c=max(c,dfs(i,-1,1));
        }
    }
    return c;
}

void main()
{
    foreach(i;0..readln.chomp.to!int())
        writeln("Case #",i+1,": ",solve());
}
