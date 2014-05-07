#!/usr/bin/env rdmd -O
import std.stdio, std.string, std.conv;
import std.algorithm, std.array, std.range;

auto solve()
{
    auto nm = readln().split().map!(to!int)();
    immutable auto N=nm[0], M=nm[1];
    auto graph = new bool[][](N,N);
    auto code = new string[N];
    {
        foreach(ref v; code) v=readln().chomp();
        auto graph2 = new bool[][](N,N);
        foreach(i;0..M)
        {
            auto xy = readln().split().map!(to!int)().map!(x=>x-1)();
            immutable auto x=xy[0], y=xy[1];
            graph2[x][y] = graph2[y][x] = true;
        }
        auto idx = iota(N).array();
        sort!("a[0]<b[0]")(zip(code,idx));
        foreach(i;0..N) foreach(j;0..N)
            graph[i][j] = graph2[idx[i]][idx[j]];
    }
    int[] order; order~=0;
    int[] path; path~=0;
    auto check(const int next)
    {
        auto alive = new bool[N]; alive[]=true;
        foreach(v;order) alive[v] = false;
        bool found = false;
        foreach_reverse(x;path)
        {
            if(graph[x][next]) found = true;
            if(found) alive[x] = true;
        }
        if(!found) return false;
        auto visited = new bool[N];
        foreach(i;0..N) if(alive[i])
        {
            void dfs(int x)
            {
                if(visited[x]) return;
                visited[x] = true;
                foreach(y;0..N) if(graph[x][y] && alive[y]) dfs(y);
            };
            dfs(i);
            break;
        }
        foreach(i;0..N) if(alive[i] && !visited[i]) return false;
        return true;
    };
    auto used = new bool[N];
    used[0] = true;
    foreach(_;1..N)
    {
        foreach(i;0..N) if(!used[i] && check(i))
        {
            order~=i;
            while(!graph[path[$-1]][i])
                path.popBack();
            path~=i;
            used[i] = true;
            break;
        }
    }
    return order.map!(v=>code[v]).join();
}

void main()
{
    foreach(i;0..readln().chomp().to!int())
        writeln("Case #",i+1,": ",solve());
}
