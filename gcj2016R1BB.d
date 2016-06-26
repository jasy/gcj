#!/usr/bin/env rdmd -O
import std.stdio, std.string, std.conv;
import std.algorithm, std.array, std.range;
import std.math;

auto solve()
{
    auto CJ = readln.split();
    immutable C=CJ[0], J=CJ[1];
    long[3] dpc, dpj;
    long b=1;
    foreach_reverse(c,j;zip(C,J))
    {
        immutable long[3] t = [abs(dpc[0]-dpj[0]),abs(b-dpc[2]+dpj[1]),abs(b+dpc[1]-dpj[2])];
        int cn, jn;
        if(c=='?')
        {
            if(j=='?')
            {
                if(t[0]<=min(t[1],t[2])) cn=0, jn=0;
                else if(t[1]<=t[2]) cn=0, jn=1;
                else cn=1, jn=0;
            }
            else
            {
                jn=j-'0';
                if(jn>0 && t[1]<=min(t[0],t[2])) cn=jn-1;
                else if(jn>=9 || t[0]<=t[2]) cn=jn;
                else cn=jn+1;
            }
        }
        else
        {
            cn=c-'0';
            if(j=='?')
            {
                if(cn>0 && t[2]<=min(t[0],t[1])) jn=cn-1;
                else if(cn>=9 || t[0]<=t[1]) jn=cn;
                else jn=cn+1;
            }
            else
            {
                jn=j-'0';
            }
        }
        if(cn<jn)
        {
            dpc[0]=dpc[2]+cn*b;
            dpj[0]=dpj[1]+jn*b;
        }
        else if(cn>jn)
        {
            dpc[0]=dpc[1]+cn*b;
            dpj[0]=dpj[2]+jn*b;
        }
        else
        {
            dpc[0]=dpc[0]+cn*b;
            dpj[0]=dpj[0]+jn*b;
        }
        if(c=='?')
        {
            dpc[2]+=9*b;
        }
        else
        {
            dpc[1]+=cn*b;
            dpc[2]+=cn*b;
        }
        if(j=='?')
        {
            dpj[2]+=9*b;
        }
        else
        {
            dpj[1]+=jn*b;
            dpj[2]+=jn*b;
        }
        b*=10;
    }
    immutable s = format("%%0%dd",C.length);
    return [dpc[0],dpj[0]].map!(x=>format(s,x)).join(" ");
}

void main()
{
    foreach(i;0..readln.chomp.to!int())
        writeln("Case #",i+1,": ",solve());
}
