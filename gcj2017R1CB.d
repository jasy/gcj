#!/usr/bin/env rdmd -w -O
import std.stdio, std.string, std.conv;
import std.algorithm, std.array, std.range;
import std.parallelism;

struct IN {
    int Ac, Aj;
    int[2][] CD;
    int[2][] JK;
};

void input(ref IN c_) {with(c_){
    auto A = readln.split.map!(to!int)();
    Ac=A[0], Aj=A[1];
    CD = new int[2][Ac];
    foreach(ref a; CD) a = readln.split.map!(to!int).array();
    JK = new int[2][Aj];
    foreach(ref a; JK) a = readln.split.map!(to!int).array();
}}

auto calc(ref int[2][] CD) {
    if(CD.length==1) {
        return 2;
    }
    if(CD[0][0]>CD[1][0]) swap(CD[0],CD[1]);
    if(CD[1][0]-CD[0][1]>=12*60) return 2;
    if(CD[1][1]-CD[0][0]<=12*60) return 2;
    return 4;
}
auto solve(IN c_) {with(c_){
    if(Ac+Aj>2) return -1;
    if(Aj==0) {
        return calc(CD);
    }
    if(Ac==0) {
        return calc(JK);
    }
    return 2;
}}

void main() {
    auto cs = new IN[readln.chomp.to!int()];
    foreach(ref c_;cs) input(c_);
    foreach(i,a;taskPool.amap!solve(cs))
        writeln("Case #",i+1,": ",a);
}
