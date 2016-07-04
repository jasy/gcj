#!/usr/bin/env rdmd -O
import std.stdio, std.string, std.conv;
import std.algorithm, std.array;

auto solve()
{
    immutable N = readln.chomp.to!int();
    auto topics = new string[2][N];
    foreach(ref a;topics) a=readln.split.array();
    auto words = new int[string][2]; 
    foreach(i,ref a;topics)
        foreach(j,ref w; a)
            if(w !in words[j])
                words[j][w]=words[j].length.to!int();
    immutable M = words.map!(x=>x.length.to!int()).sum();
    auto g = new int[][M];
    foreach(ref a; topics)
    {
        immutable v=words[0][a[0]];
        immutable w=words[1][a[1]]+words[0].length.to!int();
        g[v]~=w;
        g[w]~=v;
    }
    auto match = new int[M]; match[]=M;
    auto used = new bool[M];
    bool dfs(int v){
        used[v]=true;
        foreach(u; g[v]){
            immutable w = match[u];
            if(w==M || (!used[w] && dfs(w))){
                match[v]=u;
                match[u]=v;
                return true;
            }
        }
        return false;
    }
    int c=0;
    foreach(v; 0..M) if(match[v]==M)
    {
        used[]=false;
        if(dfs(v))
            ++c;
    }
    foreach(v; 0..M) if(match[v]==M) ++c;
    return N-c;
}

void main()
{
    foreach(i;0..readln.chomp.to!int())
        writeln("Case #",i+1,": ",solve());
}
