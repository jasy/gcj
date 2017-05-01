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
    P=P.sort().array();
    real m=0.0;
    auto dp = new real[N+1];
    foreach(s;0..N) {
        real lo=0,hi=1,r=0;
        foreach(_;0..100) {
            immutable mi=(lo+hi)/2;
            immutable t=P[s..$].map!(v=>max(0,mi-v)).sum();
            if(t>U) hi=mi;
            else lo=mi, r=U-t;
        }
        dp[]=0;
        dp[0]=1.0;
        foreach(i;0..N) {
            immutable q = i>=s? max(lo,P[i]): (i!=s-1? P[i]: min(1,P[i]+r));
            foreach_reverse(j;0..i+1) dp[j+1]=dp[j]*q+dp[j+1]*(1-q);
            dp[0]*=1-q;
        }
        m=max(m,dp[K..$].sum());
    }
    return format("%.6f",m);
}}

void main() {
    auto cs = new IN[readln.chomp.to!int()];
    foreach(ref c_;cs) input(c_);
    foreach(i,a;taskPool.amap!solve(cs))
        writeln("Case #",i+1,": ",a);
}
