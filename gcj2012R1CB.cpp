#include <iostream>
#include <iomanip>
#include <vector>
#include <cmath>

static void solve ()
{
    double D;
    int N, A;
    std::cin >> D >> N >> A;
    std::vector<double> t(N);
    std::vector<double> x(N);
    for (int i=0; i<N; ++i) {
        std::cin >> t[i] >> x[i];
    }
    std::vector<double> a(A);
    for (int i=0; i<A; ++i) {
        std::cin >> a[i];
    }
    for (int i=0; i<N; ++i) {
        if (x[i]>=D) {
            if (0!=i)
                t[i] = t[i-1] + (t[i]-t[i-1])*(D-x[i-1])/(x[i]-x[i-1]);
            x[i] = D;
            N = i+1;
            break;
        }
    }
    for (int i=0; i<A; ++i) {
        const double ai = a[i];
        double s = 0.0;
        double ti = 0.0;
        for (int i=0; i<N; ++i) {
            ti = std::sqrt(2*x[i]/ai);
            s = std::max(s, t[i]-ti);
        }
        std::cout << (s+ti) << "\n";
    }
}

int main ()
{
    int T;
    std::cin >> T;
    std::cout << std::fixed << std::setprecision(6);
    for (int i=1; i<=T; ++i) {
        std::cout << "Case #" << i << ":\n";
        solve();
    }
    return 0;
}
