#include <iostream>
#include <vector>
#include <algorithm>
#include <functional>
#include <numeric>
#include <boost/multiprecision/cpp_int.hpp>

static auto solve = []()
{
    int N;
    std::cin >> N;
    namespace mp = boost::multiprecision;
    std::vector<mp::cpp_int> t(N);
    for(auto& v: t)
        std::cin >> v;
    std::sort(t.begin(),t.end());
    t.erase(std::unique(t.begin(),t.end()),t.end());
    namespace ph = std::placeholders;
    std::transform(t.begin()+1,t.end(),t.begin()+1,
        std::bind(std::minus<mp::cpp_int>(),ph::_1,t[0]));
    auto g = std::accumulate(t.begin()+1,t.end(),mp::cpp_int(0),
        [](const mp::cpp_int& a, const mp::cpp_int& b){ return mp::gcd(a,b); });
    return mp::cpp_int((g-t[0]%g)%g);
};

int main()
{
    int T;
    std::cin >> T;
    for (int i=1; i<=T; ++i)
        std::cout << "Case #" << i << ": " << solve() << std::endl;
}
