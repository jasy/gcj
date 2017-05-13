#!/usr/bin/env rdmd -w -O
import std.stdio, std.string, std.conv;
import std.algorithm, std.array, std.range;
import std.parallelism;

struct IN {
    int N,P;
    int[] G;
};

void input(ref IN c_) {with(c_){
    auto NP = readln.split.map!(to!int)();
    N=NP[0], P=NP[1];
    G = readln.split.map!(to!int).array();
}}

auto solve(IN c_) {with(c_){
    auto r = new int[P];
    foreach(v;G) ++r[v%P];
    int c=r[0]; r[0]=0;
    foreach(i;1..P) {
        if(i==P-i) {
            immutable m = r[i]/2;
            r[i]-=m*2;
            c+=m;
        }
        else {
            immutable m = min(r[i],r[P-i]);
            r[i]-=m;
            r[P-i]-=m;
            c+=m;
        }
        immutable s = r[i]/P;
        r[i]-=s*P;
        c+=s;
    }
    if(P==4) {
        foreach(i;[1,3]) r[2]+=r[i]/2, r[i]%=2;
        c+=r[2]/2, r[2]%=2;
    }
    if(r.any!(x=>x>0)()) ++c;
    return c;
}}

void main() {
    auto cs = new IN[readln.chomp.to!int()];
    foreach(ref c_;cs) input(c_);
    foreach(i,a;taskPool.amap!solve(cs))
        writeln("Case #",i+1,": ",a);
}
