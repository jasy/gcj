#include <iostream>
#include <vector>
#include <algorithm>

static auto solve = []()
{
    int N; std::cin >> N;
    if(N<1) return 0;
    std::vector<int> cards(N);
    for(auto& v: cards) std::cin >> v;
    const auto n = *std::max_element(cards.begin(),cards.end());
    std::vector<int> num(n+2,0);
    for(auto& v: cards) ++num[v];
    std::vector<int> s,e;
    for(int i=1; i<n+2; ++i)
        if(num[i]>num[i-1])
            s.resize(s.size()+num[i]-num[i-1],i);
        else if(num[i]<num[i-1])
            e.resize(e.size()-num[i]+num[i-1],i);
    int m=N;
    for(size_t i=0; i<s.size(); ++i)
        m=std::min(m,e[i]-s[i]);
    return m;
};

int main()
{
    int T; std::cin >> T;
    for(int i=1; i<=T; ++i)
        std::cout << "Case #" << i << ": " << solve() << '\n';
}
