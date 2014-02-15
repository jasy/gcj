#include <iostream>
#include <vector>
#include <array>
#include <sstream>

static auto solve = []()
{
    int M,V; std::cin >> M >> V;
    const auto G=(M-1)/2, L=(M+1)/2;
    std::vector<std::pair<bool,bool>> gate(G);
    for(auto& v: gate) std::cin >> v.first >> v.second;
    std::vector<int> leaf(L);
    for(auto& v: leaf) std:: cin >> v;
    std::vector<std::array<int,2>> dp(M,{{M,M}});
    for(int i=0; i<L; ++i)
        dp[i+G][leaf[i]]=0;
    for(int i=G-1; i>=0; --i)
    {
        bool a,c; std::tie(a,c)=gate[i];
        const auto i1=i*2+1, i2=i*2+2;
        if(a || c)
            for(int j=0; j<2; ++j)
                for(int k=0; k<2; ++k)
                    dp[i][j&k]=std::min(dp[i][j&k],dp[i1][j]+dp[i2][k]+(a?0:1));
        if(!a || c)
            for(int j=0; j<2; ++j)
                for(int k=0; k<2; ++k)
                    dp[i][j|k]=std::min(dp[i][j|k],dp[i1][j]+dp[i2][k]+(!a?0:1));
    }
    std::ostringstream oss;
    if(dp[0][V]<M) oss << dp[0][V];
    else oss << "IMPOSSIBLE";
    return oss.str();
};

int main()
{
    int T; std::cin >> T;
    for(int i=1; i<=T; ++i)
        std::cout << "Case #" << i << ": " << solve() << '\n';
}
