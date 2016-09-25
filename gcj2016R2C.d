#!/usr/bin/env rdmd -O
import std.stdio, std.string, std.conv;
import std.algorithm, std.array, std.range;
import std.typecons;

auto solve()
{
    auto RC = readln.split.map!(to!int);
    immutable R=RC[0], C=RC[1];
    immutable p=readln.split.map!(x=>x.to!int()-1).array();
    immutable N2=R+C, N=N2*2;
    alias Tuple!(int,"s",int,"e") T;
    auto dist(T v) { return (v.e-v.s+N)%N; }
    auto se = new T[N2];
    foreach(i,ref v;se) {
        v.s=p[i*2], v.e=p[i*2+1];
        if(dist(v)>N2) swap(v.s,v.e);
    }
    se.sort!((x,y)=>dist(x)<dist(y))();
    immutable char E = '*';
    auto g = new char[][](R,C);
    foreach(ref a;g) a[]=E;
    foreach(v;se) {
        int x,y,dx,dy;
        void pos(int i) {
            if(i<C) x=i, y=-1, dx=0, dy=1;
            else if(i<C+R) x=C, y=i-C, dx=-1, dy=0;
            else if(i<C+R+C) x=C-(i-(C+R))-1, y=R, dx=0, dy=-1;
            else x=-1, y=R-(i-(C+R+C))-1, dx=1, dy=0;
        }
        pos(v.s); x+=dx; y+=dy;
        while(0<=x && x<C && 0<=y && y<R) {
            if(g[y][x]==E) g[y][x]="/\\"[dx?0:1];
            swap(dx,dy);
            if(g[y][x]=='/') dx*=-1, dy*=-1;
            x+=dx; y+=dy;
        }
        immutable px=x, py=y;
        pos(v.e);
        if(px!=x || py!=y) return "\nIMPOSSIBLE";
    }
    foreach(ref a;g) foreach(ref c;a) if(c==E) c='/';
    return "\n"~g.map!(to!string).join("\n");
}

void main()
{
    foreach(i;0..readln.chomp.to!int())
        writeln("Case #",i+1,": ",solve());
}
