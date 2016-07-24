#!/usr/bin/env rdmd -O
import std.stdio, std.string, std.conv;
import std.algorithm;
import core.bitop;

auto solve()
{
    uint tobin(string s){ uint b=0; foreach(c;s) b<<=1,b|=(c=='0'?0:1); return b; }
    immutable N = readln.chomp.to!int();
    uint t = 0;
    foreach(_;0..N) t<<=N, t|=tobin(readln.chomp());
    int m=int.max;
    foreach(b;0..1<<N*N) if((b&t)==t)
    {
        bool check()
        {
            auto a = new uint[N];
            foreach(i,ref v;a) v=b>>i*N&(1<<N)-1;
            sort(a);
            uint u=0;
            bool f=true;
            for(int i=0; i<N;)
            {
                immutable v=a[i];
                immutable n=_popcnt(v);
                if(v==0||(v&u)||i+n>N) return false;
                u|=v;
                foreach(w;a[i+1..i+n]) if(v!=w) return false;
                i+=n;
            }
            return u==(1<<N)-1;
        }
        if(check()) m=min(m,_popcnt(b^t));
    }
    return m;
}

void main()
{
    foreach(i;0..readln.chomp.to!int())
        writeln("Case #",i+1,": ",solve());
}
