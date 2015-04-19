#!/usr/bin/env rdmd -O
import std.stdio, std.string, std.conv;
import std.algorithm, std.array, std.range;
import std.container, std.typecons;

enum{ X0, Y0, X1, Y1, XY };
auto dist(int a0, int a1, int b0, int b1)
{
    if(a1<b0) return b0-a1-1;
    if(b1<a0) return a0-b1-1;
    return 0;
}
auto dist(const int[XY] a, const int[XY] b)
{
    auto x = dist(a[X0],a[X1],b[X0],b[X1]);
    auto y = dist(a[Y0],a[Y1],b[Y0],b[Y1]);
    return max(x,y);
}

auto solve()
{
    auto whb = readln.split.map!(to!int);
    immutable W=whb[0], H=whb[1], B=whb[2];
    auto xy = new int[XY][B];
    foreach(ref a;xy) a = readln.split.map!(to!int).array();
    immutable S=B, T=S+1, N=T+1;
    auto d = new int[][](N,N);
    d[S][T]=d[T][S]=W;
    foreach(i;0..N) d[i][i]=0;
    foreach(i;0..B)
        d[S][i]=d[i][S]=xy[i][X0],
        d[T][i]=d[i][T]=W-1-xy[i][X1];
    foreach(i;0..B)
        foreach(j;i+1..B)
            d[i][j]=d[j][i]=dist(xy[i],xy[j]);
    alias Tuple!(int,"t",int,"v") V;
    BinaryHeap!(Array!V,"a>b") q;
    auto u = new bool[N];
    q.insert(V(0,S));
    while(!q.empty)
    {
        auto v = q.front; q.popFront();
        if(u[v.v]) continue;
        u[v.v]=true;
        if(v.v==T) return v.t;
        foreach(i;0..N)
            if(!u[i] && v.t+d[v.v][i]<=W)
                q.insert(V(v.t+d[v.v][i],i));
    }
    return -1;
};

void main()
{
    foreach(i;0..readln.chomp.to!int())
        writeln("Case #",i+1,": ",solve());
}
