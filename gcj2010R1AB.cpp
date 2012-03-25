#include <iostream>
#include <vector>
#include <algorithm>

static int solve() {
    const int VM = 256;
    int D,I,M,N;
    std::cin >> D >> I >> M >> N;
    std::vector<int> a(N+1);
    for (int i=1; i<=N; ++i) {
        std::cin >> a[i];
    }
    std::vector<std::vector<int> > dp(N+1,std::vector<int>(VM));
    for (int i=1; i<=N; ++i) {
        for (int j=0; j<VM; ++j) {
            dp[i][j] = dp[i-1][j]+D;
        }
        for (int j=0; j<VM; ++j) {
            const int s = std::max(0,j-M);
            const int e = std::min(j+M+1,VM);
            for (int k=s; k<e; ++k) {
                dp[i][j] = std::min(dp[i][j],dp[i-1][k]+std::abs(a[i]-j));
            }
        }
        if (0!=M) {
            for (int j=0; j<VM; ++j) {
                for (int k=0; k<VM; ++k) {
                    dp[i][j] = std::min(dp[i][j],dp[i][k]+(std::abs(j-k)+M-1)/M*I);
                }
            }
        }
    }
    int r = dp[N][0];
    for (int i=1; i<VM; ++i) {
        r = std::min(r,dp[N][i]);
    }
    return r;
}

int main () {
    int T;
    std::cin >> T;
    for (int i=1; i<=T; ++i) {
        std::cout << "Case #" << i << ": " << solve() << "\n";
    }
    return 0;
}
