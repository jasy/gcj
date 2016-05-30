#!/usr/bin/env rdmd -O
import std.stdio, std.string, std.conv;
import std.algorithm, std.array, std.range;
import std.container, std.typecons;
import std.math;

auto solve()
{
    immutable N = readln.chomp.to!int();
    auto P = readln.split.map!(to!int).array();
    string[] r;
    while(1)
    {
        string v;
        int m=-1;
        size_t c;
        foreach(i,s;P) if(s>m) m=s, c=i;
        if(m<=0) return r.join(" ");
        v~=('A'+c).to!char();
        --P[c];
        m=-1;
        int n=0;
        foreach(i,s;P)
        {
            if(s>=m)
            {
                if(s>m) n=0;
                m=s, c=i, ++n;
            }
        }
        if(n!=2)
        {
            v~=('A'+c).to!char();
            --P[c];
        }
        else if(m>1)
        {
            auto t=m; m=-1;
            foreach(i,s;P)
                if(s<t && s>m)
                    m=s, c=i;
            if(m>0)
            {
                v~=('A'+c).to!char();
                --P[c];
            }
        }
        r~=v;
    }
    assert(false);
}

void main()
{
    foreach(i;0..readln.chomp.to!int())
        writeln("Case #",i+1,": ",solve());
}
