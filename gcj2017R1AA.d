#!/usr/bin/env rdmd -w -O
import std.stdio, std.string, std.conv;
import std.algorithm, std.array, std.range;
import std.parallelism;

struct IN {
    int R,C;
    char[][] g;
};

void input(ref IN c) {
    auto m = readln.split.map!(to!int)();
    c.R=m[0];
    c.C=m[1];
    auto g = new char[][](c.R,c.C);
    foreach(ref r;g) r=readln.chomp.to!(char[])();
    c.g=g;
}

auto solve(IN a) {
    immutable R=a.R, C=a.C;
    auto g = a.g;
    auto u = new bool[][](R,C);
    foreach(r;0..R) foreach(c;0..C) if(g[r][c]!='?' && !u[r][c]) {
        immutable v=g[r][c];
        auto r1=r,r2=r,c1=c,c2=c;
        while(r1>0){
            if(g[r1-1][c]!='?') break;
            g[r1-1][c]=v;
            --r1;
        }
        while(c1>0){
            bool f=true;
            foreach(i;r1..r2+1)
                if(g[i][c1-1]!='?'){ f=false; break; }
            if(!f) break;
            foreach(i;r1..r2+1)
                g[i][c1-1]=v;
            --c1;
        }
        while(c2+1<C){
            bool f=true;
            foreach(i;r1..r2+1)
                if(g[i][c2+1]!='?'){ f=false; break; }
            if(!f) break;
            foreach(i;r1..r2+1)
                g[i][c2+1]=v;
            ++c2;
        }
        while(r2+1<R){
            bool f=true;
            foreach(i;c1..c2+1)
                if(g[r2+1][i]!='?'){ f=false; break; }
            if(!f) break;
            foreach(i;c1..c2+1)
                g[r2+1][i]=v;
            ++r2;
        }
        foreach(i;r1..r2+1) foreach(j;c1..c2+1) u[i][j]=true;
    }
    return "\n"~g.join("\n");
}

void main() {
    auto cs = new IN[readln.chomp.to!int()];
    foreach(ref c;cs) input(c);
    foreach(i,a;taskPool.amap!solve(cs))
        writeln("Case #",i+1,": ",a);
}
