#!/usr/bin/env dmd -O -run
import std.stdio;
import std.string;
import std.array;
import std.conv;
import std.algorithm;
import std.container;

string solve()
{
    auto rnmk = readln().split().map!(to!int);
    auto R = rnmk[0];
    auto N = rnmk[1];
    auto M = rnmk[2];
    auto K = rnmk[3];
    auto A = new long[][R];
    foreach(ref a;A)
        a = readln().split().map!(to!long).array();
    auto s = "";
    foreach(a;A)
    {
        auto p = new int[M+1];
        foreach(v;a)
        {
            for(auto n=2; v>1; ++n)
            {
                auto pn = 0;
                while(v%n==0)
                    v/=n,++pn;
                p[n]=max(p[n],pn);
            }
        }
        auto c = reduce!((x,y)=>x+y)(p);
        p[2]+=max(0,N-c);
        c=max(c,N);
        while(c>N)
        {
            if(p[2]>=2)
                p[2]-=2,++p[2*2];
            else
                assert(false);
            --c;
        }
        auto ss = "\n";
        foreach(i,v;p)
            foreach(j;0..v)
                ss~=i.to!string();
        s~=ss;
    }
    return s;
}

void main()
{
    foreach(i;0..readln().chomp().to!int())
        writeln("Case #",i+1,": ",solve());
}
