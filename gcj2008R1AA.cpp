#include <iostream>
#include <vector>
#include <algorithm>
#include <numeric>

static auto solve = []()
{
    int n; std::cin >> n;
    std::vector<long long> x(n);
    for(auto& v: x) std::cin >> v;
    std::vector<long long> y(n);
    for(auto& v: y) std::cin >> v;
    std::sort(x.begin(),x.end());
    std::sort(y.rbegin(),y.rend());
    return std::inner_product(x.begin(),x.end(),y.begin(),0ll);
};

int main()
{
    int T; std::cin >> T;
    for (int i=1; i<=T; ++i)
        std::cout << "Case #" << i << ": " << solve() << '\n';
}
