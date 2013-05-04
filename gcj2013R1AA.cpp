#include <iostream>
// Boost 1.53 http://www.boost.org/
#include <boost/multiprecision/cpp_int.hpp>
namespace mp = boost::multiprecision;

static mp::cpp_int isqrt(const mp::cpp_int x)
{
    mp::cpp_int t,y=x>>1;
    while(y>(t=x/y))
        y=(t+y)>>1;
    return y;
}

static long long solve ()
{
    long long r,t;
    std::cin >> r >> t;
    mp::cpp_int b = 2*r-1;
    mp::cpp_int c = -t;
    mp::cpp_int s = (-b+isqrt(b*b-8*c))/4;
    return s.convert_to<long long>();
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
