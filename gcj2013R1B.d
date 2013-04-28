import std.stdio;
import std.string;
import std.array;
import std.conv;
import std.algorithm;

long solve()
{
    auto ern = readln().split().map!(to!long);
    auto E = ern[0];
    auto R = ern[1];
    auto N = ern[2];
    auto v = readln().split().map!(to!long).array();
    auto e = E;
    long g = 0;
    foreach(i,v1;v)
    {
        auto m = e;
        foreach(j,v2;v[i+1..$])
        {
            if(v1<v2)
            {
                m = max(0,min(E,(j+1)*R)-(E-e));
                break;
            }
        }
        e=min(E,e-m+R);
        g+=v1*m;
    }
    return g;
}

void main()
{
    foreach(i;0..readln().chomp().to!int())
        writeln("Case #",i+1,": ",solve());
}
