#!/usr/bin/env rdmd -O
import std.stdio, std.string, std.conv;
import std.algorithm, std.array;

auto solve()
{
    immutable auto N = readln().chomp().to!int();
    auto A = readln().split().map!(to!int)().array();
    immutable auto S = A.dup.sort.idup;
    int c=0;
    int l=0, r=N-1;
    foreach(v;S)
    {
        for(int i=l; i<=r; ++i)
        {
            if(A[i]==v)
            {
                auto a=i-l, b=r-i;
                if(a<b)
                {
                    c+=a;
                    foreach_reverse(j;l..i)
                        A[j+1]=A[j];
                    ++l;
                }
                else
                {
                    c+=b;
                    foreach(j;i..r)
                        A[j]=A[j+1];
                    --r;
                }
                break;
            }
        }
    }
    return c;
}

void main()
{
    foreach(i;0..readln().chomp().to!int())
        writeln("Case #",i+1,": ",solve());
}
