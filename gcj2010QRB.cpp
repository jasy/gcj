#include <iostream>
#include <vector>
#include <algorithm>
#include <boost/multiprecision/cpp_int.hpp>

static auto solve = []()
{
    int N;
    std::cin >> N;
    namespace mp = boost::multiprecision;
    std::vector<mp::cpp_int> t(N);
    for(auto& v: t)
        std::cin >> v;
    const auto m = *min_element(t.begin(),t.end());
    mp::cpp_int g=0;
    for(const auto& v: t)
        g=mp::gcd(g,v-m);
    return mp::cpp_int((g-m%g)%g);
};

int main()
{
    int T;
    std::cin >> T;
    for (int i=1; i<=T; ++i)
        std::cout << "Case #" << i << ": " << solve() << std::endl;
}
