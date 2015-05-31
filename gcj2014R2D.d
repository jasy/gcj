#!/usr/bin/env rdmd -O
import std.stdio, std.string, std.conv;
import std.algorithm, std.array, std.range;

immutable int MOD = 1000000007;
immutable long[][] C;

static this()
{
    immutable N=101;
    auto b = new long[](N);
    foreach(i;0..N)
    {
        auto c = new long[](N);
        foreach(j;0..i+1)
            if(j==0 || i==j) c[j]=1;
            else c[j]=(b[j-1]+b[j])%MOD;
        C ~= c.idup;
        swap(c,b);
    }
}

auto solve()
{
    auto mn = readln.split.map!(to!int);
    immutable M=mn[0], N=mn[1];
    string[] S;
    foreach(i;0..M) S~=readln.chomp;
    assert(N<C.length);
    enum A = 26;
    struct Trie
    {
        int n;
        int[A+1] t;
    }
    Trie[] trie;
    trie.reserve(S.map!"a.length".sum().to!int()+M+1);
    trie~=Trie();
    foreach(s;S)
    {
        int p=0;
        auto add(immutable int v)
        {
            if(trie[p].t[v]<=0)
            {
                trie[p].t[v] = trie.length.to!int();
                trie~=Trie();
            }
            p=trie[p].t[v];
            ++trie[p].n;
        }
        ++trie[p].n;
        foreach(c;s) add(c-'A');
        add(A);
    }
    int m=-M,n=1;
    foreach(ref t;trie)
    {
        immutable k = min(t.n,N);
        m+=k;
        immutable a = t.t.array().filter!"a>0".map!(p=>min(trie[p].n,N)).array().idup;
        if(a.length>0)
        {
            auto dp = new int[k+1];
            foreach(i;0..k+1)
            {
                dp[i] = 1;
                foreach(v;a) dp[i] = dp[i] * C[i][v] % MOD;
                foreach(j;0..i) dp[i] = (dp[i] - dp[j] * C[i][j] % MOD + MOD) % MOD;
            }
            n = 1L * n * dp[k] % MOD;
        }
    }
    return [m,n].map!(to!string).join(" ");
};

void main()
{
    foreach(i;0..readln.chomp.to!int())
        writeln("Case #",i+1,": ",solve());
}
