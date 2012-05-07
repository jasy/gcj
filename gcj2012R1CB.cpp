#include <iostream>
#include <iomanip>
#include <vector>
#include <cmath>

static void solve (const double D, const std::vector<double>& t, const std::vector<double> x, double a)
{
    double mt = 0;
    double mx = 0;
    double mv = 0;
    const int n = t.size();
    for (int i=1; i<n; ++i) {
        double ct = t[i];
        double cx = x[i];
        if (cx>D) {
            ct = t[i-1] + (ct-t[i-1])*(D-x[i-1])/(cx-x[i-1]);
            cx = D;
        }
        const double d = cx - mx;
        const double dt = (-mv + sqrt(mv*mv+2*a*d))/a;
        if (mt+dt >= ct) {
            mt += dt;
            mx += d;
            mv += a*dt;
        }
        else {
            mt = ct;
            mx += d;
            mv = (cx-x[i-1])/(ct-t[i-1]);
        }
        if (mx >= D) {
            break;
        }
    }
    std::cout << mt << "\n";
}

static void solve ()
{
    double D;
    int N, A;
    std::cin >> D >> N >> A;
    std::vector<double> t(N+1,0.0);
    std::vector<double> x(N+1,0.0);
    for (int i=1; i<=N; ++i) {
        std::cin >> t[i] >> x[i];
    }
    std::vector<double> a(A);
    for (int i=0; i<A; ++i) {
        std::cin >> a[i];
    }
    for (int i=0; i<A; ++i) {
        solve(D, t, x, a[i]);
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
