#include <iostream>
#include <vector>
#include <algorithm>
#include <limits>

typedef unsigned long T;
static void dfs(int n, int m, T& g, T& v, const int N, const int M)
{
    if(n<0 || N<=n || m<0 || M<=m) return;
    const int i = n*M+m;
    const T b = 1L<<i;
    if(v&b) return;
    v|=b;
    g&=~b;
    dfs(n-1,m,g,v,N,M);
    dfs(n+1,m,g,v,N,M);
    dfs(n,m-1,g,v,N,M);
    dfs(n,m+1,g,v,N,M);
}

static auto solve = []()
{
    int N,M,K; std::cin >> N >> M >> K;
    int c = std::numeric_limits<int>::max();
    for(T b=0; b<(1L<<N*M); ++b)
    {
        T g=(1L<<N*M)-1, v=b;
        for(int n=0; n<N; ++n)
            dfs(n,0  ,g,v,N,M),
            dfs(n,M-1,g,v,N,M);
        for(int m=0; m<M; ++m)
            dfs(0  ,m,g,v,N,M),
            dfs(N-1,m,g,v,N,M);
        if(K<=std::__pop_count(g))
            c=std::min(c,std::__pop_count(b));
    }
    return c;
};

int main()
{
    std::cin.tie(0);
    std::ios_base::sync_with_stdio(false);
    int T; std::cin >> T;
    for (int i=1; i<=T; ++i)
        std::cout << "Case #" << i << ": " << solve() << std::endl;
}
