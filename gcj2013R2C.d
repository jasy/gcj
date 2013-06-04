#!/usr/bin/env dmd -O -run
import std.stdio, std.string, std.conv;
import std.algorithm, std.array;

auto solve()
{
    immutable auto N = readln().chomp().to!int();
    immutable auto A = readln().split().map!(to!int).array().idup;
    immutable auto B = readln().split().map!(to!int).array().idup;
    auto g = new bool[int][N];
    foreach(i;0..N)
    {
        foreach_reverse(j;0..i) if(A[i]==A[j])
        {
            g[j][i]=true;
            break;
        }
        foreach_reverse(j;0..i) if(A[i]==A[j]+1)
        {
            g[i][j]=true;
            break;
        }

        foreach(j;i+1..N) if(B[i]==B[j])
        {
            g[j][i]=true;
            break;
        }
        foreach(j;i+1..N) if(B[i]==B[j]+1)
        {
            g[i][j]=true;
            break;
        }
    }
    auto X = new int[N];
    foreach(n;1..N+1)
    {
        foreach(i;0..N) if(X[i]==0 && g[i].length==0)
        {
            X[i]=n;
            foreach(ref v;g)
                v.remove(i);
            break;
        }
    }
    return X.map!(to!string).join(" ");
}

void main()
{
    foreach(i;0..readln().chomp().to!int())
        writeln("Case #",i+1,": ",solve());
}
