#!/usr/bin/env rdmd -O
import std.stdio, std.string, std.conv;
import std.algorithm, std.array, std.range;
import std.math, std.typecons;

auto solve()
{
    auto JPSK = readln.split.map!(to!int);
    immutable J=JPSK[0], P=JPSK[1], S=JPSK[2], K=JPSK[3];
    alias Tuple!(int,"j",int,"p",int,"s") T;
    T[] r;
    if(max(J,P,S)<=K)
    {
        r.reserve(J*P*S);
        for(int j=0; j<J; ++j)
            for(int p=0; p<P; ++p)
                for(int s=0; s<S; ++s)
                    r~=T(j,p,s);
    }
    else
    {
        immutable B = 1u << J*P*S;
        auto m = new char[1u<<(J+P+S)];
        T[] t; t.reserve(J*P*S);
        for(uint b=0; b<B; ++b)
        {
            ()
            {
                m[]=0;
                t.length=0;
                foreach(j;0..J)
                    foreach(p;0..P)
                        foreach(s;0..S)
                        {
                            immutable jn = j*P*S;
                            immutable pn = p*S;
                            immutable sn = s;
                            if(b&(1<<(jn+pn+sn)))
                            {
                                immutable jb = 1u << (j+P+S);
                                immutable pb = 1u << (p+S);
                                immutable sb = 1u << s;
                                t~=T(j,p,s);
                                foreach(v; [jb|pb, pb|sb, sb|jb])
                                    if(++m[v]>K) return;
                            }
                        }
                if(r.length<t.length) swap(r,t);
            }();
        }
    }
    return (r.length.to!string()~r.map!((v)=>[v.j+1,v.p+1,v.s+1].map!(to!string).join(" ")).array()).join("\n");
}

void main()
{
    foreach(i;0..readln.chomp.to!int())
        writeln("Case #",i+1,": ",solve());
}
