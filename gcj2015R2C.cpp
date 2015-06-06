#include <iostream>
#include <vector>
#include <string>
#include <map>
#include <limits>
#include <sstream>
#include <algorithm>
#include <queue>
#include <tuple>

// Dinic's algorithm
template<class T, class U=int, class F=int>
F dinic(const T& edges, U max_v, U s, U t)
{
    typedef typename T::value_type Edge;
    std::vector<std::vector<Edge>> g(max_v);
    for(auto& e: edges){
        const auto& c = std::get<0>(e);
        const auto& s = std::get<1>(e);
        const auto& t = std::get<2>(e);
        g[s].emplace_back(c, t, g[t].size());
        g[t].emplace_back(0, s, g[s].size()-1);
    }
    const F INF = std::numeric_limits<F>::max()/2;
    F flow=0;
    for(;;){
        std::vector<int> dist(max_v,-1); dist[s]=0;
        {
            std::queue<U> q; q.push(s);
            while(!q.empty()){
                auto v = q.front(); q.pop();
                for(auto& e: g[v]){
                    const auto& c = std::get<0>(e);
                    const auto& t = std::get<1>(e);
                    if(c>0 && dist[t]<0)
                        dist[t] = dist[v]+1,
                        q.push(t);
                }
            }
        }
        if(dist[t]<0) break;
        std::vector<int> iter(max_v,0);
        class Func{
        public:
            static F dfs(U v, U u, F f, std::vector<std::vector<Edge>>& g, const std::vector<int>& dist, std::vector<int>& iter){
                if(v==u) return f;
                const int N = g[v].size();
                for(auto& i=iter[v]; i<N; ++i){
                    auto& e = g[v][i];
                    auto& c = std::get<0>(e);
                    const auto& t = std::get<1>(e);
                    const auto& r = std::get<2>(e);
                    if(c>0 && dist[v] < dist[t]){
                        F d = dfs(t, u, std::min(f,c), g, dist, iter);
                        if(d!=0){
                            c-=d;
                            std::get<0>(g[t][r])+=d;
                            return d;
                        }
                    }
                }
                return 0;
            }
        };
        F f;
        while((f = Func::dfs(s, t, INF, g, dist, iter))>0) flow += f;
    }
    return flow;
}

static auto solve()
{
    int N; std::cin >> N >> std::ws;
    std::vector<std::vector<int>> ss(N);
    int c=0;
    {
        std::map<std::string,int> dic;
        for(auto&a:ss)
        {
            std::string s;
            getline(std::cin,s);
            std::istringstream iss(s);
            std::string w;
            while(iss >> w)
            {
                if(!dic.count(w)) dic[w]=c++;
                a.push_back(dic[w]);
            }
        }
    }
    typedef int Flow;
    typedef int Vertex;
    typedef std::tuple<Flow,Vertex,Vertex> Edge;
    auto wvi = [N](int n){ return n*2+N; };
    auto wvo = [N](int n){ return n*2+1+N; };
    std::vector<Edge> edges;
    for(int i=0; i<c; ++i)
    {
        edges.emplace_back(1,wvi(i),wvo(i));
        edges.emplace_back(1,wvo(i),wvi(i));
    }
    for(int i=0; i<N; ++i)
    {
        auto&a=ss[i];
        std::sort(a.begin(),a.end());
        a.erase(std::unique(a.begin(),a.end()),a.end());
        for(auto v:a)
        {
            edges.emplace_back(1,i,wvi(v));
            edges.emplace_back(1,wvo(v),i);
        }
    }
    return dinic(edges,N+c*2,0,1);
}

int main()
{
    std::cin.tie(0);
    std::ios_base::sync_with_stdio(false);
    int T; std::cin >> T;
    for (int i=1; i<=T; ++i)
        std::cout << "Case #" << i << ": " << solve() << '\n';
}
