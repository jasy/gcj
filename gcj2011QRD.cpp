#include <iostream>

static int solve () {
    int N;
    std::cin >> N;
    int n = 0;
    for (int i=1; i<=N; ++i) {
        int t;
        std::cin >> t;
        if (t!=i) {
            ++n;
        }
    }
    return n;
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
