#include <iostream>
#include <iomanip>
#include <vector>

static void solve ()
{
    int N;
    std::cin >> N;
    std::vector<int> s(N);
    int X = 0;
    for (int i=0; i<N; ++i) {
        std::cin >> s[i];
        X += s[i];
    }
    const int XN = X*2/N;
    int n = N;
    int X2 = X*2;
    for (int i=0; i<N; ++i) {
        if (XN < s[i]) {
            --n;
            X2 -= s[i];
        }
    }
    const double a = X2 / (double)n;
    for (int i=0; i<N; ++i) {
        double x;
        if (XN >= s[i])
            x = (a-s[i])/X*100;
        else
            x = 0;
        std::cout << " " << x;
    }
}

int main ()
{
    int T;
    std::cin >> T;
    std::cout << std::fixed << std::setprecision(6);
    for (int i=1; i<=T; ++i) {
        std::cout << "Case #" << i << ":";
        solve();
        std::cout << "\n";
    }
    return 0;
}
