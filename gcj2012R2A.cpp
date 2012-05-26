#include <iostream>
#include <string>
#include <vector>

static std::string solve ()
{
    int N;
    std::cin >> N;
    std::vector<int> d(N+1,0);
    std::vector<int> i(N+1,0);
    for (int n=1; n<=N; ++n) {
        std::cin >> d[n] >> i[n];
    }
    int D;
    std::cin >> D;
    std::vector<int> dp(N+1,0);
    dp[0] = std::min(d[1],i[1]);
    for (int n=1; n<=N; ++n) {
        for (int m=0; m<n; ++m) {
            const int di = d[n]-d[m];
            if (di<=dp[m]) {
                dp[n] = std::min(di, i[n]);
                if (dp[n]+d[n]>=D) {
                    return "YES";
                }
                break;
            }
        }
        if (dp[n]==0) {
            break;
        }
    }
    return "NO";
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
