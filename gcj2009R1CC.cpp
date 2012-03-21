#include <iostream>
#include <vector>
#include <limits>

static int solve() {
    int P,Q;
    std::cin >> P >> Q;
    const int n = Q+2;
    std::vector<int> num(n);
    num[0] = 0;
    num[n-1] = P+1;
    for (int i=1; i<n-1; ++i) {
        std::cin >> num[i];
    }
    std::vector<std::vector<int> > dp(n,std::vector<int>(n));
    for (int i=2; i<n; ++i) {
        for (int j=0; j<n-i; ++j) {
            const int s = j;
            const int e = j+i;
            int c = std::numeric_limits<int>::max();
            for (int k=s+1; k<e; ++k) {
                c = std::min(c,dp[s][k]+dp[k][e]);
            }
            dp[s][e] = c + num[e]-num[s]-2;
        }
    }
    return dp[0][n-1];
}

int main ()
{
    int N;
    std::cin >> N;
    for (int i=1; i<=N; ++i) {
        std::cout << "Case #" << i << ": " << solve() << "\n";
    }
    return 0;
}
