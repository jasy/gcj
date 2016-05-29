#!/usr/bin/env rdmd -O
import std.stdio, std.string, std.conv;

auto solve()
{
    immutable S = readln.chomp();
    int[26] n;
    foreach(c;S) ++n[c-'A'];
    int[10] d;
    void dec(string t, int i){ foreach(c;t) n[c-'A']-=i; }
    void fix(int i, char c, string t)
    {
        d[i]=n[c-'A'];
        dec(t,d[i]);
    }
    fix(0, 'Z', "ZERO");
    fix(2, 'W', "TWO");
    fix(6, 'X', "SIX");
    fix(8, 'G', "EIGHT");
    fix(4, 'U', "FOUR");
    fix(1, 'O', "ONE");
    fix(3, 'T', "THREE");
    fix(5, 'F', "FIVE");
    fix(7, 'S', "SEVEN");
    fix(9, 'I', "NINE");
    string r;
    foreach(i;0..10) foreach(_;0..d[i]) r~=i.to!string();
    return r;
}

void main()
{
    foreach(i;0..readln.chomp.to!int())
        writeln("Case #",i+1,": ",solve());
}
