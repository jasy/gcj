#include <iostream>
#include <vector>
#include <string>
#include <sstream>

static int solve ()
{
    int A,B;
    std::cin >> A >> B;
    std::vector<bool> u(B+1,false);
    int n = 0;
    for (int i=B; i>=A; --i) {
        if (u[i])
            continue;
        u[i] = true;
        int c = 0;
        int l = 1;
        {
            int d = i;
            while (d/=10) ++l;
        }
        int h = 1;
        for (int j=1; j<l; ++j) {
            h *= 10;
        }
        int m = i;
        for (int j=1; j<l; ++j) {
            m = m/10 + m%10 * h;
            if (m<A || B<m || u[m])
                continue;
            u[m] = true;
            ++c;
        }
        n += c*(c+1)/2;
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
