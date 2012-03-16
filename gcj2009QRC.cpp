#include <iostream>
#include <iomanip>
#include <string>

static const char S[] = "welcome to code jam";
static const int L = sizeof(S)-1;

static int solve() {
    std::string str;
    std::getline(std::cin,str);
    int dp[L+1] = {1};
    for (auto const& c: str) {
        for (int i=L-1; i>=0; --i) {
            if (c==S[i]) {
                dp[i+1] = (dp[i+1] + dp[i]) % 10000;
            }
        }
    }
    return dp[L];
}

int main ()
{
    int N;
    std::cin >> N;
    {
        std::string str;
        std::getline(std::cin,str);
    }
    for (int i=1; i<=N; ++i) {
        std::cout << "Case #" << i << ": "
        << std::setw(4) << std::setfill('0') << solve()
        << "\n";
    }
    return 0;
}
