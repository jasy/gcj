#!/usr/bin/env rdmd -O
import std.stdio, std.string, std.conv;
import std.algorithm, std.array, std.typecons;

auto solve()
{
    auto m = readln().split().map!(to!long)().map!(i=>i-1)();
    immutable auto A=m[0], B=m[1], K=m[2];
    long[1<<3] dp; dp[0]=1;
    foreach_reverse(d;0..30)
    {
        long[1<<3] dpn;
        foreach(f;0..1<<3)
        {
            auto fa=f>>2&1, fb=f>>1&1, fk=f>>0&1;
            auto ba=A>>d&1, bb=B>>d&1, bk=K>>d&1;
            foreach(a;0..2) foreach(b;0..2)
            {
                auto k = a&b;
                if(!fa && a>ba) continue;
                if(!fb && b>bb) continue;
                if(!fk && k>bk) continue;
                auto key = f;
                if(a<ba) key |= 1<<2;
                if(b<bb) key |= 1<<1;
                if(k<bk) key |= 1<<0;
                dpn[key]+=dp[f];
            }
        }
        swap(dp,dpn);
    }
    return dp.reduce!("a+b");
}

void main()
{
    foreach(i;0..readln().chomp().to!int())
        writeln("Case #",i+1,": ",solve());
}
