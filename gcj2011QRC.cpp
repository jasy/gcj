#include <iostream>
#include <string>
#include <sstream>
#include <limits>
#include <algorithm>

static std::string solve () {
    int N;
    std::cin >> N;
    int sum = 0;
    int sum_x = 0;
    int min = std::numeric_limits<int>::max();
    for (int i=0; i<N; ++i) {
        int t;
        std::cin >> t;
        sum += t;
        sum_x ^= t;
        min = std::min(min,t);
    }
    if (0!=sum_x) {
        return "NO";
    }
    else {
        std::stringstream ss;
        ss << (sum-min);
        return ss.str();
    }
}

int main ()
{
    int T;
    std::cin >> T;
    for (int i=1; i<=T; ++i) {
        std::cout << "Case #" << i << ": " << solve() << "\n";
    }
    return 0;
}
