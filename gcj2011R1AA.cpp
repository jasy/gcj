#include <iostream>
#include <string>

static long long gcd(long long a, long long b) {
    while (b) {
        const long long t=b;
        b=a%b;
        a=t;
    }
    return a;
}

static std::string solve() {
    long long N,PD,PG;
    std::cin >> N >> PD >> PG;
    const long long dg = gcd(PD, 100);
    const long long db = 100/dg;
    bool f;
    if (db>N) {
        f=false;
    }
    else if (PD!=100&&PG==100) {
        f=false;
    }
    else if (PD!=0&&PG==0) {
        f=false;
    }
    else {
        f=true;
    }
    return f? "Possible": "Broken";
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
