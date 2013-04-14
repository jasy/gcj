import std.stdio;
import std.string;
import std.array;
import std.conv;
import std.algorithm;

string solve()
{
    auto nm = readln().split().map!(to!int);
    auto N = nm[0];
    auto M = nm[1];
    auto a = new int[][N];
    foreach(i;0..N)
        a[i] = readln().split().map!(to!int).array();
    auto an = new int[N];
    auto am = new int[M];
    foreach(i;0..N)
        foreach(j;0..M)
            an[i]=max(an[i],a[i][j]),
            am[j]=max(am[j],a[i][j]);
    foreach(i;0..N)
        foreach(j;0..M)
            if(a[i][j]<an[i]&&a[i][j]<am[j])
                return "NO";
    return "YES";
}

void main()
{
    foreach(i;0..readln().chomp().to!int())
        writeln("Case #",i+1,": ",solve());
}
