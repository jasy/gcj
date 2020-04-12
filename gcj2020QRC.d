#!/usr/bin/env rdmd -w -O
import std.stdio, std.string, std.conv;
import std.algorithm, std.array, std.range;

auto solve(){
    immutable N = readln.chomp.to!int();
    auto SE = new int[][N];
    foreach(i,ref a;SE) a = readln.split.map!(to!int).array()~i.to!int();
    SE.sort;
    auto a = new char[N];
    a[]=0;
    foreach(k,c;"CJ"){
        auto n=0;
        foreach(ref se;SE){
            immutable s=se[0], e=se[1], i=se[2];
            if(a[i]) continue;
            if(s<n){
                if(k>0) return "IMPOSSIBLE";
                else continue;
            }
            n=e;
            a[i]=c;
        }
    }
    return a.to!string();
}

void main(){
    foreach(i;0..readln.chomp.to!int())
        writeln("Case #",i+1,": ",solve());
}
