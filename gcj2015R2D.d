#!/usr/bin/env rdmd -O
import std.stdio, std.string, std.conv;
import std.algorithm, std.array, std.range;

immutable MOD = 1000000007;
immutable N = 100;
immutable int[N+1][1<<3] c;

static this()
{
    foreach(b;0..1<<3)
    {
        immutable long a23=(b>>0&1)*3, a26=(b>>1&1)*6, a34=(b>>2&1)*4;
        immutable S = 3;
        auto dp = new int[2][N+S];
        dp[S-1][0] = dp[S-1][1] = 1;
        foreach(i;S..S+N)
        {
            dp[i][1] = (dp[i][1]+dp[i-2][0])%MOD;
            dp[i][0] = (dp[i][0]+dp[i-1][1])%MOD;
            dp[i][0] = (dp[i][0]+dp[i-2][1]*(a23+a26))%MOD;
            dp[i][0] = (dp[i][0]+dp[i-3][1]*a34)%MOD;
            c[b][i-S+1] = (dp[i][0]+dp[i][1])%MOD;
        }
    }
}

long inv(long a)
{
    long b=MOD;
    long u=0, v=1;
    while(a)
    {
        long t=b/a;
        swap(b-=t*a,a);
        swap(u-=t*v,v);
    }
    return (u+MOD)%MOD;
}

auto solve()
{
    auto rc = readln.split.map!(to!int);
    immutable R=rc[0], C=rc[1];
    assert(R<=N);
    int a=0;
    foreach(i;1..C+1)
    {
        immutable b0 = C%3==0&&i%3==0?(1<<0):0;
        immutable b1 = C%6==0&&i%6==0?(1<<1):0;
        immutable b2 = C%4==0&&i%4==0?(1<<2):0;
        a = (a+c[b0|b1|b2][R])%MOD;
    }
    a = a*inv(C)%MOD;
    return a;
}

void main()
{
    foreach(i;0..readln.chomp.to!int())
        writeln("Case #",i+1,": ",solve());
}
