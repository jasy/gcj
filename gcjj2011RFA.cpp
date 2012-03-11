#include <iostream>
#include <vector>
#include <algorithm>
#include <cmath>
#include <iomanip>

static double solve ()
{
    int K;
    std::cin >> K;
    std::vector<int> E(K);
    for (int i=0; i<K; ++i) {
        std::cin >> E[i];
    }
    std::sort(E.begin(), E.end());
    double P = 0;
    const double h = std::sin(2*3.14159265358979323846/K);
    int w1,w2;
    w1 = w2 = E[K-1];
    for (int i=K-2; i>=0; --i) {
        const int e = E[i];
        P+=e*h*w1/2;
        w1=w2;
        w2=e;
    }
    P+=E[0]*h*w1/2;
    return P;
}

int main ()
{
    int T;
    std::cin >> T;
    std::cout << std::setprecision(20);
    for (int i=1; i<=T; ++i) {
        std::cout << "Case #" << i << ": " << solve() << "\n";
    }
    return 0;
}

