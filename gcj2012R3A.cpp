#include <iostream>
#include <sstream>
#include <vector>
#include <algorithm>

static auto solve = []()
{
    int N; std::cin >> N;
    std::vector<double> L(N);
    for(auto& v: L) std::cin >> v;
    std::vector<double> P(N);
    for(auto& v: P) std::cin >> v;
    std::vector<std::pair<double,int>> t(N);
    for(int i=0; i<N; ++i)
        t[i].first = P[i]/L[i],
        t[i].second = -i;
    std::sort(t.rbegin(),t.rend());
    std::ostringstream oss;
    for(int i=0; i<N; ++i)
    {
        if(i!=0) oss << ' ';
        oss << -t[i].second;
    }
    return oss.str();
};

int main()
{
    int T; std::cin >> T;
    for(int i=1; i<=T; ++i)
        std::cout << "Case #" << i << ": " << solve() << '\n';
}
