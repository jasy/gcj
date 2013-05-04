#include <iostream>
#include <iomanip>
// Boost 1.53 http://www.boost.org/
#include <boost/multiprecision/cpp_dec_float.hpp>
namespace mp = boost::multiprecision;

static mp::cpp_dec_float_100 solve ()
{
    int N,X,Y;
    std::cin >> N >> X >> Y;
    const int n = (std::abs(X)+Y)/2;
    int c = 0;
    for(int i=1; i<=n; ++i)
        c+=i*4-3;
    if(N<c)
        return 0;
    const int m = (n+1)*4-3;
    if(N>=c+m)
        return 1;
    int r = N-c;
    int h = Y;
    if(r-m/2>h)
        return 1;
    if(m/2<=h)
        return 0;
    if(r>m/2)
    {
        const int rr = r-m/2; 
        h-=rr;
        r-=rr*2;
    }
    mp::cpp_dec_float_100 a = 0;
    mp::cpp_dec_float_100 k = 0;
    for(int i=0; i<=r; ++i)
    {
        mp::cpp_dec_float_100 b = 1;
        for(int j=r; j>r-i; --j)
            b*=j;
        for(int j=2; j<=i; ++j)
            b/=j;
        if(h<i)
            k+=b;
        a+=b;
    }
    return k/a;
}

int main ()
{
    int T;
    std::cin >> T;
    std::cout << std::fixed << std::setprecision(6);
    for (int i=1; i<=T; ++i) {
        std::cout << "Case #" << i << ": " << solve() << '\n';
    }
    return 0;
}
