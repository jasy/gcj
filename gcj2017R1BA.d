#!/usr/bin/env rdmd -w -O
import std.stdio, std.string, std.conv;
import std.algorithm, std.array, std.range;
import std.parallelism;

struct IN {
    int D;
    int N;
    int[][] KS;
};

void input(ref IN c_) {with(c_){
    auto m = readln.split.map!(to!int)();
    D=m[0];
    N=m[1];
    KS = new int[][N];
    foreach(ref v;KS) v = readln.split.map!(to!int).array();
}}

auto solve(IN c_) {with(c_){
    real t=0;
    foreach(ref v;KS) t=max(t,(D-v[0])*1.0/v[1]);
    return format("%.6f",D/t);
}}

void main() {
    auto cs = new IN[readln.chomp.to!int()];
    foreach(ref c_;cs) input(c_);
    foreach(i,a;taskPool.amap!solve(cs))
        writeln("Case #",i+1,": ",a);
}
