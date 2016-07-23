#!/usr/bin/env rdmd -O
import std.stdio, std.string, std.conv;
import std.algorithm, std.array, std.range;

// Union Find
class UnionFind(T)
{
    T[] p,r;
    T find(const T x){ return x==p[x]? x: (p[x]=find(p[x])); }
public:
    this(const T n)
    {
        r=new T[n];
        p=iota(T(n)).array();
    }
    bool same(const T x, const T y){ return find(x)==find(y); }
    void unite(T x, T y)
    {
        x=find(x);
        y=find(y);
        if(x==y) return;
        if(r[x]>r[y]) swap(x,y);
        else if(r[x]==r[y]) ++r[y];
        p[x]=y;
    }
};

auto solve()
{
    auto RC = readln.split.map!(to!int);
    immutable R=RC[0], C=RC[1];
    immutable p=readln.split.map!(x=>x.to!int()-1).array();
    immutable B=(R+1)*C;
    immutable N = (R+1)*C+R*(C+1);
    auto q=new int[]((R+C)*2);
    foreach(i;0..C) q[i]=i;
    foreach(j;0..R) q[j+C]=C+j*(C+1)+B;
    foreach(i;0..C) q[i+C+R]=B-1-i;
    foreach(j;0..R) q[j+C+R+C]=(R-1-j)*(C+1)+B;
    foreach(b;0..1<<R*C)
    {
        auto uf=new UnionFind!(int)(N);
        foreach(r;0..R) foreach(c;0..C)
        {
            immutable m=r*C+c;
            immutable int[2] u=[r*C+c,(r+1)*C+c];
            immutable int[2] s=[r*(C+1)+c+B,r*(C+1)+c+1+B];
            immutable v=b>>m&1;
            uf.unite(u[0],s[v]);
            uf.unite(u[1],s[1-v]);
        }
        bool f=true;
        foreach(i;0..(C+R))
            if(!uf.same(q[p[i*2]],q[p[i*2+1]])){f=false; break;}
        if(!f) continue;
        auto g=new string[](R+1);
        foreach(r;0..R) foreach(c;0..C)
            g[r+1]~="/\\"[b>>(r*C+c)&1];
        return g.join("\n");
    }
    return "\nIMPOSSIBLE";
}

void main()
{
    foreach(i;0..readln.chomp.to!int())
        writeln("Case #",i+1,": ",solve());
}
