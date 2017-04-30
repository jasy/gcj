#!/usr/bin/env rdmd -w -O
import std.stdio, std.string, std.conv;
import std.algorithm, std.array, std.range;
import std.parallelism;
import std.typecons;

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

auto solve(IN c_) {with(c_){
    size_t n = Ac+Aj;
    if(n<2) return 2;
    alias Tuple!(int,"b",int,"e",int,"p") T;
    T[] s; s.reserve(n);
    auto t = [0,0];
    foreach(ref a;CD) t[0]+=a[1]-a[0], s~=T(a[0],a[1],0);
    foreach(ref a;JK) t[1]+=a[1]-a[0], s~=T(a[0],a[1],1);
    s = s.sort().array();
    auto p = new int[][2];
    foreach(i,ref v;s) {
        auto w = s[(i+1)%$];
        if(v.p==w.p) p[v.p]~=(w.b-v.e+24*60)%(24*60);
    }
    foreach(i,q;p) {
        foreach(k,v;q.sort().array()) {
            if(t[i]+v>12*60) {
                n+=q.length-k;
                break;
            }
            t[i]+=v;
            --n;
        }
    }
    return n;
}}

void main() {
    auto cs = new IN[readln.chomp.to!int()];
    foreach(ref c_;cs) input(c_);
    foreach(i,a;taskPool.amap!solve(cs))
        writeln("Case #",i+1,": ",a);
}
