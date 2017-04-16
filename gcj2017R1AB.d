#!/usr/bin/env rdmd -w -O
import std.stdio, std.string, std.conv;
import std.algorithm, std.array, std.range;
import std.parallelism;
import std.math;

struct IN {
    int N,P;
    int[] R;
    int[][] Q;
};

void input(ref IN c) {
    auto m = readln.split.map!(to!int)();
    c.N = m[0];
    c.P = m[1];
    c.R = readln.split.map!(to!int).array();
    c.Q = new int[][c.N];
    foreach(ref a;c.Q) a = readln.split.map!(to!int).array();
}

bool check(real v, real r, real n) {
    auto t=r*n;
    return t*9<=v*10 && v*10<=t*11;
}

auto solve(IN c) {
    immutable N=c.N, P=c.P;
    auto R=c.R;
    auto Q=c.Q;
    foreach(ref a;Q) a=a.sort().array();
    auto p = new int[N];
    int s=0;
    int n=0;
    foreach(i;0..N) n=max(n,round(Q[i][P-1]*1.0/R[i]).to!int());
    foreach(i;1..n+1) {
        bool f() {
            foreach(j;0..N) {
                bool a=false;
                while(p[j]<P) {
                    if(check(Q[j][p[j]],R[j],i)){ a=true; break; }
                    if(R[j]*1.0*i<Q[j][p[j]]) return false;
                    p[j]++;
                }
                if(!a) return false;
            }
            foreach(j;0..N) p[j]++;
            return true;
        }
        while(f()) ++s;
    }
    return s;
}

void main() {
    auto cs = new IN[readln.chomp.to!int()];
    foreach(ref c;cs) input(c);
    foreach(i,a;taskPool.amap!solve(cs))
        writeln("Case #",i+1,": ",a);
}
