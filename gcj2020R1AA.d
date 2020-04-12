#!/usr/bin/env rdmd -w -O
import std.stdio, std.string, std.conv;
import std.algorithm, std.array, std.range;

auto solve(){
    immutable N = readln.chomp.to!int();
    auto ps = new string[][N];
    foreach(ref a;ps) a = readln.chomp.split("*").array();
    string head, last;
    foreach(ref a;ps){
        if(head.empty){
            head = a[0];
        }
        else{
            if(head.length<a[0].length){
                if(!startsWith(a[0],head)) return "*";
                head = a[0];
            }
            else{
                if(!startsWith(head,a[0])) return "*";
            }
        }
        if(last.empty){
            last = a[$-1];
        }
        else{
            if(last.length<a[$-1].length){
                if(!endsWith(a[$-1],last)) return "*";
                last = a[$-1];
            }
            else{
                if(!endsWith(last,a[$-1])) return "*";
            }
        }
    }
    string r = head;
    foreach(ref a;ps) r ~= a[1..$-1].join("");
    r ~= last;
    return r;
}

void main(){
    foreach(i;0..readln.chomp.to!int())
        writeln("Case #",i+1,": ",solve());
}
