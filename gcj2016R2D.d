#!/usr/bin/env rdmd -O
import std.stdio, std.string, std.conv;
import std.algorithm, std.array;
import core.bitop;

auto solve()
{
    immutable N = readln.chomp.to!int();
    alias ulong T;
    assert(N<=T.sizeof*8/2);
    int c=0;
    auto d = new T[N*2];
    foreach(i,ref v;d) v|=T(1)<<i;
    foreach(i;0..N) foreach(j,b;readln()[0..N]) if(b!='0') {
        d[i] |= T(1)<<j+N;
        d[j+N] |= T(1)<<i;
        --c;
    }
    foreach(k;0..N*2) foreach(i;0..N*2) foreach(j;0..N*2)
        d[i] |= (d[i]>>k & d[k]>>j & 1)<<j;
    T u=0;
    int[2] s; s[]=0;
    int[2][] g;
    int[2][] r; r~=[0,0];
    foreach(i;0..N*2) if((u>>i&1)==0) {
        immutable v=d[i];
        u|=v;
        immutable a=_popcnt(v&(1<<N)-1), b=_popcnt(v>>N);
        immutable int[2] t=[a,b];
        if(a==b) c+=a*b;
        else if(a+b==1) s[]+=t[];
        else {
            g~=t;
            r.reserve(r.length*2);
            foreach(ref w;r[0..$]) ++r.length, r.back[]=w[]+t[];
        }
    }
    auto dp = new int[][][](r.length,s[0]+1,s[1]+1);
    immutable INF = int.max/2;
    foreach(ref dpm;dp) foreach(ref dpi;dpm) dpi[]=INF;
    dp[0][0][0]=0;
    foreach(m,ref dpm;dp) foreach(int i,ref dpi;dpm) foreach(int j,ref v;dpi) {
        if(i>0 && j>0) v=dp[m][i-1][j-1]+1;
        for(auto m2=m; m2>0; m2=m2-1&m) {
            immutable a=r[m2][0],b=r[m2][1];
            immutable t=max(a,b);
            immutable ri=i-(t-a), rj=j-(t-b);
            if(ri<0 || rj<0) continue;
            v=min(v,dp[m^m2][ri][rj]+t*t);
        }
    }
    return c+dp[$-1][$-1][$-1];
}

void main()
{
    foreach(i;0..readln.chomp.to!int())
        writeln("Case #",i+1,": ",solve());
}
