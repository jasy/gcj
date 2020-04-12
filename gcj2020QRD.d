#!/usr/bin/env rdmd -w -O
import std.stdio, std.string, std.conv;
import std.algorithm, std.array, std.range;

bool solve(int B){
    stderr.writeln("=== Start ===");
    int rev(int p){ return B+1-p; }
    int query(int q){
        stdout.writeln(q); stdout.flush();
        stderr.writeln(q);
        immutable t = readln()[0];
        assert(t=='0' || t=='1');
        return t-'0';
    }
    auto a = new int[B+1];
    a[]=2;
    int eq=-1,neq=-1,p=1,r=rev(p);
    foreach(i;0..15){
        immutable v = query(eq>0?eq:1);
        if(eq>0 && a[eq]!=v) foreach(ref b;a) b=(1-b);
        immutable w = query(neq>0?neq:B);
        if(neq>0 && a[neq]!=w) foreach(k;1..p) swap(a[k],a[rev(k)]);
        if(p<=1){
            a[1]=v;
            a[B]=w;
        }
        foreach(j;2..10){
            immutable bool h = j&1;
            immutable q = h?r:p;
            a[q]=query(q);
            if(h){
                if(a[p]==a[r]){
                    if(eq<0) eq=p;
                }
                else{
                    if(neq<0) neq=p;
                }
                r=rev(++p);
                if(p>r) break;
            }
        }
        stderr.writeln(a[1..$].map!(to!string).join(""));
        if(p>r) break;
    }
    stdout.writeln(a[1..$].map!(to!string).join("")); stdout.flush();
    return readln.chomp() == "Y";
}

void main(){
    auto TB = readln.split.map!(to!int)();
    immutable T=TB[0], B=TB[1];
    stderr.writeln("B: ", B);
    foreach(_;0..T) if(!solve(B)) break;
}
