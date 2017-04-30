#!/usr/bin/env rdmd -w -O
import std.stdio, std.string, std.conv;
import std.algorithm, std.array, std.range;
import std.parallelism;
import std.typecons;
import std.math;

alias Tuple!(real,"R",real,"H") T;
struct IN {
    int N,K;
    T[] RH;
};

void input(ref IN c_) {with(c_){
    auto NK = readln.split.map!(to!int)();
    N=NK[0], K=NK[1];
    RH = new T[N];
    foreach(ref a;RH) {
        auto rh = readln.split.map!(to!real)();
        a.R=rh[0];
        a.H=rh[1];
    }
}}

auto solve(IN c_) {with(c_){
    RH.sort;
    alias Tuple!(real, "S", size_t, "n") U;
    auto s = new U[N];
    foreach(i,ref v;RH) {
        s[i].S=2*PI*v.R*v.H;
        s[i].n=i;
    }
    s.sort;
    auto r=RH[s[N-1].n].R;
    real t=0;
    foreach_reverse(ref v;s[N-K..N]) {
        if(r<RH[v.n].R) r=RH[v.n].R;
        t+=v.S;
    }
    t+=1*PI*r*r;
    size_t n=N-K;
    foreach_reverse(i,ref v;s[0..N-K]) {
        if(RH[v.n].R>r) {
            immutable a = PI*RH[v.n].R*RH[v.n].R+v.S;
            immutable b = PI*r*r+s[n].S;
            if(a>b) {
                n=i;
                r=RH[v.n].R;
                t+=a-b;
            }
        }
    }
    return format("%.6f",t);
}}

void main() {
    auto cs = new IN[readln.chomp.to!int()];
    foreach(ref c_;cs) input(c_);
    foreach(i,a;taskPool.amap!solve(cs))
        writeln("Case #",i+1,": ",a);
}
