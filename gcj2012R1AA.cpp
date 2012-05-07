#include <iostream>
#include <iomanip>
#include <vector>

static double solve ()
{
    int A,B;
    std::cin >> A >> B;
    std::vector<double> p(A);
    for (int i=0; i<A; ++i) {
        std::cin >> p[i];
    }
    double g = B+2;
    double c = 1.0;
    for (int i=0; i<=A; ++i) {
        if (0!=i) {
            c*=p[i-1];
        }
        g = std::min(g,(A-i)+(B-i+1)+(B+1)*(1.0-c));
    }
    return g;
}

int main ()
{
    int T;
    std::cin >> T;
    std::cout << std::fixed << std::setprecision(6);
    for (int i=1; i<=T; ++i) {
        std::cout << "Case #" << i << ": " << solve() << "\n";
    }
    return 0;
}
