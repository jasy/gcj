#include <iostream>
#include <vector>
#include <string>
#include <algorithm>
#include <limits>

static auto solve = []()
{
    int N; std::cin >> N;
    std::vector<std::string> S(N);
    for(auto& v: S) std::cin >> v;
    auto cs = S[0];
    cs.erase(std::unique(cs.begin(),cs.end()),cs.end());
    int n=0;
    std::vector<int> p(N,0);
    for(auto c: cs)
    {
        std::vector<int> cnt(N,0);
        for(int i=0; i<N; ++i)
        {
            const auto& s = S[i];
            const int sn = s.size();
            int j=p[i];
            for( ; j<sn && s[j]==c; ++j);
            if((cnt[i]=j-p[i])==0)
                return std::string("Fegla Won");
            p[i]=j;
        }
        std::sort(cnt.begin(),cnt.end());
        for(int i=0; i<N; ++i)
            n+=std::abs(cnt[i]-cnt[N/2]);
    }
    for(int i=0; i<N; ++i)
    {
        const int sn = S[i].size();
        if(p[i]!=sn)
            return std::string("Fegla Won");
    }
    return std::to_string(n);
};

int main()
{
    std::cin.tie(0);
    std::ios_base::sync_with_stdio(false);
    int T; std::cin >> T;
    for (int i=1; i<=T; ++i)
        std::cout << "Case #" << i << ": " << solve() << std::endl;
}
