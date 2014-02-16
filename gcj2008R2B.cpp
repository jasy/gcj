#include <iostream>
#include <sstream>
#include <string>

static auto solve = []()
{
    int N,M,A; std::cin >> N >> M >> A;
    if(A>N*M)
        return std::string("IMPOSSIBLE");
    const int h=(A+N-1)/N, w=N*h-A;
    std::ostringstream oss;
    oss << "0 0 " << N << ' ' << 1 << ' ' << w << ' ' << h;
    return oss.str();
};

int main()
{
    int T; std::cin >> T;
    for(int i=1; i<=T; ++i)
        std::cout << "Case #" << i << ": " << solve() << '\n';
}
