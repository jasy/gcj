#include <iostream>

static int count (const unsigned long long n)
{
    int c=0;
    for (int i=0; i<sizeof(unsigned long long)*8; ++i) {
        if (n&(1ull<<i)) {
            ++c;
        }
    }
    return c;
}

static int solve ()
{
    unsigned long long N;
    std::cin >> N;
    for (int i=sizeof(unsigned long long)*8-1; i>=0; --i) {
        const unsigned long long n = (1ull<<i)-1;
        if (N>=n) {
            return i+count(N-n);
        }
    }
    return -1;
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
