#!/usr/bin/env dmd -O -run
import std.stdio, std.string, std.conv;
import std.algorithm;
import std.file;

string[] dic;

auto solve()
{
    enum D = 5;
    auto S = readln().chomp();
    auto N = S.length;
    auto dp = new int[D][N+1];
    dp.fill(int.max);
    dp[0][0]=0;
    foreach(i,ref a;dp[0..$-1])
    {
        foreach(j,ref v;a)
        {
            if(v==int.max) continue;
            foreach(w;dic)
            {
                auto n = w.length;
                if(i+n>N) continue;
                auto p = j;
                auto m = 0;
                foreach(k,c;w)
                {
                    if(c!=S[i+k])
                    {
                        if(p>0)
                        {
                            p=D;
                            break;
                        }
                        p=D;
                        ++m;
                    }
                    if(p>0)
                        --p;
                }
                if(p>=D) continue;
                dp[i+n][p] = min(dp[i+n][p],v+m);
            }
        }
    }
    return reduce!(min)(dp[N]);
}

void main()
{
    dic = readText("garbled_email_dictionary.txt").split();
    foreach(i;0..readln().chomp().to!int())
        writeln("Case #",i+1,": ",solve());
}
