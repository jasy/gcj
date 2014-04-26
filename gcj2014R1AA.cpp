#include <iostream>
#include <vector>
#include <string>
#include <algorithm>

static auto solve = []()
{
    int N,L; std::cin >> N >> L;
    std::vector<unsigned long long> o(N,0ULL);
    std::vector<unsigned long long> d(N,0ULL);
    for(auto& v: o)
    {
        std::string s; std::cin >> s;
        for(auto c: s) v<<=1, v|=c!='0';
    }
    for(auto& v: d)
    {
        std::string s; std::cin >> s;
        for(auto c: s) v<<=1, v|=c!='0';
    }
    std::sort(d.begin(),d.end());
    const int INF = L+1;
    int n=INF;
    for(auto v: o)
    {
        auto t = o;
        const auto b = d[0]^v;
        for(auto& v: t) v^=b;
        std::sort(t.begin(),t.end());
        if(t==d) n=std::min(n,std::__pop_count(b));
    }
    if(n==INF) return std::string("NOT POSSIBLE");
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
