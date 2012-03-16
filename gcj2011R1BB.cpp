#include <iostream>
#include <iomanip>
#include <vector>
#include <algorithm>
#include <cmath>

static double solve() {
    int C,D;
    std::cin >> C >> D;
    std::vector<int> p;
    for (int i=0; i<C; ++i) {
        int P,V;
        std::cin >> P >> V;
        for (int j=0; j<V; ++j)
            p.push_back(P);
    }
    const int n = p.size();
    const int digit = 6+6;
    const int s = 10*(digit/3+1);
    const double v = std::pow(10.0,digit);
    double dmin = 0.0;
    double dmax = v;
    for (int i=0; i<s; ++i) {
        const double d = (dmin+dmax)/2;
        double pos = -v;
        bool r = true;
        for (int j=0; j<n; ++j) {
            const double next = pos + D;
            if (p[j]+d<next) {
                r = false;
                break;
            }
            pos = std::max(next,p[j]-d);
        }
        if (r)
            dmax = d;
        else
            dmin = d;
    }
    return std::floor(dmin+dmax+0.5)/2;
}

int main ()
{
    int T;
    std::cin >> T;
    std::cout << std::setiosflags(std::ios::fixed);
    for (int i=1; i<=T; ++i) {
        std::cout << "Case #" << i << ": " << solve() << "\n";
    }
    return 0;
}
