#!/usr/bin/env rdmd -w -O
import std.stdio, std.string, std.conv;
import std.algorithm, std.array, std.range;
import std.parallelism;

struct IN {
    int N,R,O,Y,G,B,V;
};

void input(ref IN c_) {with(c_){
    auto m = readln.split.map!(to!int)();
    N=m[0]; R=m[1], O=m[2], Y=m[3], G=m[4], B=m[5], V=m[6];
}}

string solve(IN c_) {with(c_){
    immutable IMPOSSIBLE = "IMPOSSIBLE";
    if(G>R) return IMPOSSIBLE;
    if(O>B) return IMPOSSIBLE;
    if(V>Y) return IMPOSSIBLE;
    if(R!=0 && G==R && (O || B || V || Y)) return IMPOSSIBLE;
    if(B!=0 && O==B && (G || R || V || Y)) return IMPOSSIBLE;
    if(Y!=0 && V==Y && (G || R || O || G)) return IMPOSSIBLE;
    auto s = new char[N];
    if(R!=0 && G==R) {
        foreach(i,ref c;s) c=(i&1)?'R':'G';
        return s.to!string();
    }
    if(B!=0 && O==B) {
        foreach(i,ref c;s) c=(i&1)?'O':'B';
        return s.to!string();
    }
    if(Y!=0 && V==Y) {
        foreach(i,ref c;s) c=(i&1)?'V':'Y';
        return s.to!string();
    }
    int k=0;
    auto n = [R-G, Y-V, B-O];
    auto u = [false,false,false];
    int f=-1,l=-1;
    foreach(i;0..sum(n)) {
        int p=-1, m=0;
        foreach(int j,v;n) if(j!=l && (v>m || (f==j && v>=m))) p=j,m=v;
        if(p==-1) return IMPOSSIBLE;
        if(i==0) f=p;
        l=p;
        n[p]--;
        if(p==0) {
            s[k++]='R';
            if(!u[p]) {
                u[p]=true;
                foreach(j;0..G) s[k++]='G',s[k++]='R';
            }
        }
        if(p==1) {
            s[k++]='Y';
            if(!u[p]) {
                u[p]=true;
                foreach(j;0..V) s[k++]='V',s[k++]='Y';
            }
        }
        if(p==2) {
            s[k++]='B';
            if(!u[p]) {
                u[p]=true;
                foreach(j;0..O) s[k++]='O',s[k++]='B';
            }
        }
    }
    if(f==l) return IMPOSSIBLE;
    return s.to!string();
}}

void main() {
    auto cs = new IN[readln.chomp.to!int()];
    foreach(ref c_;cs) input(c_);
    foreach(i,a;taskPool.amap!solve(cs))
        writeln("Case #",i+1,": ",a);
}
