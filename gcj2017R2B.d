#!/usr/bin/env rdmd -w -O
import std.stdio, std.string, std.conv;
import std.algorithm, std.array, std.range;
import std.parallelism;

struct IN {
    int N,C,M;
    int[2][] PB;
};

void input(ref IN c_) {with(c_){
    auto NCM = readln.split.map!(to!int)();
    N=NCM[0], C=NCM[1], M=NCM[2];
    PB = new int[2][M];
    foreach(ref a;PB) a = readln.split.map!(to!int).array();
}}

auto solve(IN c_) {with(c_){
    if(C!=2) return "-1 -1";
    auto t = new int[](C);
    auto c = new int[](N);
    foreach(ref a;PB) ++t[a[1]-1], ++c[a[0]-1];
    int r=t.reduce!max();
    int p=0;
    foreach(i,s;c) {
        if(s>r) {
            if(i==0) {
                r=s;
            }
            else {
                p+=s-r;
            }
        }
    }
    return [r,p].map!(to!string).join(" ");
}}

void main() {
    auto cs = new IN[readln.chomp.to!int()];
    foreach(ref c_;cs) input(c_);
    foreach(i,a;taskPool.amap!solve(cs))
        writeln("Case #",i+1,": ",a);
}
