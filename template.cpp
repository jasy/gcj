// clang++ -std=c++14 -stdlib=libc++ -Wall -Wextra -O3 -march=native
#include <iostream>
#include <iomanip>

static auto solve()
{
    return 0.0;
}

int main()
{
    std::cin.tie(0);
    std::ios_base::sync_with_stdio(false);
    std::cout << std::fixed << std::setprecision(6);
    int T; std::cin >> T;
    for (int i=1; i<=T; ++i)
        std::cout << "Case #" << i << ": " << solve() << '\n';
}
