#!/usr/bin/env rdmd -w -O
import std.stdio, std.string, std.conv;
import std.algorithm, std.array, std.range;
import std.parallelism;

struct IN {
    int N,Q;
    int[2][] ES;
    long[][] D;
    int[2][] UV;
};

void input(ref IN c_) {with(c_){
    auto NQ = readln.split.map!(to!int)();
    N=NQ[0], Q=NQ[1];
    ES = new int[2][N];
    foreach(ref a;ES) a = readln.split.map!(to!int).array();
    D = new long[][](N,N);
    foreach(ref a;D) a = readln.split.map!(to!long).array();
    UV = new int[2][Q];
    foreach(ref a; UV) a = readln.split.map!(to!int).array();
}}

auto solve(IN c_) {with(c_){
    immutable INF = long.max/2;
    foreach(i,ref a;D) foreach(j,ref v;a)
        if(i==j) v=0;
        else if(v<0) v=INF;
    foreach(k;0..N) foreach(i;0..N) foreach(j;0..N)
        D[i][j]=min(D[i][j],D[i][k]+D[k][j]);
    auto t = new real[][](N,N);
    foreach(i,ref a;t) foreach(j,ref v;a)
        if(i==j) v=0;
        else if(D[i][j]>ES[i][0]) v=INF;
        else v=D[i][j]*1.0/ES[i][1];
    foreach(k;0..N) foreach(i;0..N) foreach(j;0..N)
        t[i][j]=min(t[i][j],t[i][k]+t[k][j]);
    return UV.map!(x=>format("%.6f",t[x[0]-1][x[1]-1])).join(" ");
}}

void main() {
    auto cs = new IN[readln.chomp.to!int()];
    foreach(ref c_;cs) input(c_);
    foreach(i,a;taskPool.amap!solve(cs))
        writeln("Case #",i+1,": ",a);
}
