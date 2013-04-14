import std.stdio;
import std.string;
import std.conv;
import std.algorithm;
import std.bigint;

static char i2c(int i){ return (i+'0').to!char(); }

BigInt solve()
{
    auto ab = readln().split();
    auto A = ab[0].to!BigInt();
    auto B = ab[1].to!BigInt();
    BigInt c=0;
    foreach(i;[1,4,9])
        if(A<=i&&i<=B)
            ++c;
    char[][] pat = [[2,1],[8,2],[4,1,1],[6,1,1,1],[8,1,1,1,1]];
    char[][] mid = [[0],[0,1,2]];
    foreach(n;max(2,ab[0].length/2)..ab[1].length/2+2)
    {
        foreach(ns;pat)
        {
            if(n/2<ns.length-1)
                continue;
            auto s = new char[n];
            foreach(m;mid[n%2])
            {
                if(ns[0]+m*m>9)
                    break;
                s[n/2]=m.i2c();
                s[0]=s[$-1]=ns[1].i2c();
                auto ps = new int[n/2-1];
                foreach(i,v;ns[2..$])
                    ps[n/2-ns.length+1+i]=v;
                do{
                    foreach(i,v;ps)
                        s[i+1]=s[$-2-i]=v.i2c();
                    auto d = s.to!BigInt();
                    auto dd = d*d;
                    if(dd<A) continue;
                    if(B<dd) break;
                    ++c;
                }while(nextPermutation(ps));
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

