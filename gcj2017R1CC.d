#!/usr/bin/env rdmd -w -O
import std.stdio, std.string, std.conv;
import std.algorithm, std.array, std.range;
import std.parallelism;

struct IN {
    int N,K;
    real U;
    real[] P;
};

void input(ref IN c_) {with(c_){
    auto NK = readln.split.map!(to!int)();
    N=NK[0], K=NK[1];
    U = readln.chomp.to!real();
    P = readln.split.map!(to!real).array();
}}

auto solve(IN c_) {with(c_){
    P.sort; P~=1.0;
    real p=0.0;
    foreach(i,v;P) {
        immutable t = (v-p)*i;
        if(t>U) foreach(j,ref w;P[0..i]) w+=U/i;
        else    foreach(j,ref w;P[0..i]) w=v;
        U-=t;
        if(U<=0) break;
        p=v;
    }
    real x=1.0;
    foreach(v;P) x*=v;
    return format("%.6f",x);
}}

void main() {
    auto cs = new IN[readln.chomp.to!int()];
    foreach(ref c_;cs) input(c_);
    foreach(i,a;taskPool.amap!solve(cs))
        writeln("Case #",i+1,": ",a);
}
