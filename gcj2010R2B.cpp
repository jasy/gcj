#include <iostream>
#include <vector>
#include <limits>

static auto solve = []()
{
    int P; std::cin >> P;
    const int N = 1<<P;
    std::vector<int> M(N);
    for(auto& v: M) std::cin >> v;
    std::vector<std::vector<int>> t(P);
    for(int i=0; i<P; ++i)
    {
        t[i].resize(1<<(P-i-1));
        for(auto& v: t[i]) std::cin >> v;
    }
    const auto INF = std::numeric_limits<int>::max()/4;
    std::vector<std::vector<int>> dp(N,std::vector<int>(P+1,INF));
    for(int i=0; i<N; ++i)
        for(int r=P-M[i]; r<=P; ++r)
            dp[i][r]=0;
    for(int p=0; p<P; ++p)
    {
        const auto n=N>>(p+1), m=P-p;
        std::vector<std::vector<int>> dpn(n,std::vector<int>(m));
        for(int i=0; i<n; ++i) for(int r=0; r<m; ++r)
        {
            const auto i1=i*2, i2=i1+1;
            const auto c1=dp[i1][r]+dp[i2][r];
            const auto c2=dp[i1][r+1]+dp[i2][r+1]+t[p][i];
            dpn[i][r]=std::min({INF,c1,c2});
        }
        dp.swap(dpn);
    }
    return dp[0][0];
};

int main()
{
    int T; std::cin >> T;
    for(int i=1; i<=T; ++i)
        std::cout << "Case #" << i << ": " << solve() << '\n';
}
