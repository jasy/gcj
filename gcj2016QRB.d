#!/usr/bin/env rdmd -O
import std.stdio, std.string, std.conv;

auto solve()
{
    immutable S = readln.chomp();
    int n=0;
    bool h=true;
    foreach_reverse(c;S)
        if(h!=(c=='+'))
            ++n, h=!h;
    return n;
}

void main()
{
    foreach(i;0..readln.chomp.to!int())
        writeln("Case #",i+1,": ",solve());
}
