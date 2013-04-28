import std.stdio;
import std.string;
import std.conv;
import std.algorithm;
import std.bigint;

static long solve()
{
    auto rt = readln().split().map!(to!long);
    auto r = rt[0];
    auto t = rt[1];
    long xl = 0;
    long xr = long.max/2;
    while(xl<xr-1)
    {
        auto n = (xl+xr)/2;
        if(BigInt(2)*n*n+(BigInt(2)*r-1)*n<=t)
            xl=n;
        else
            xr=n;
    }
    return xl;
}

void main()
{
    foreach(i;0..readln().chomp().to!int())
        writeln("Case #",i+1,": ",solve());
}
