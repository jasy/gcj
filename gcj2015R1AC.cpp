#include <iostream>
#include <vector>
#include <cmath>
#include <algorithm>
#include <limits>

// Vector 2D
template<class T>
struct Vec2D
{
    T x,y;
    explicit Vec2D(T x_=T(), T y_=T()):x(x_),y(y_){}
    Vec2D(const std::pair<T,T>& p):x(p.first),y(p.second){}
    Vec2D& operator+=(const Vec2D& v){ return *this = *this+v; }
    Vec2D& operator-=(const Vec2D& v){ return *this = *this-v; }
    friend Vec2D operator+(const Vec2D& l, const Vec2D& r){ return Vec2D(l.x+r.x,l.y+r.y); }
    friend Vec2D operator-(const Vec2D& l, const Vec2D& r){ return Vec2D(l.x-r.x,l.y-r.y); }
    friend T abs(const Vec2D& v){ return std::hypot(v.x,v.y); }
    friend T norm(const Vec2D& v){ return v.x*v.x+v.y*v.y; }
    friend T dot(const Vec2D& l, const Vec2D& r){ return l.x*r.x+l.y*r.y; }
    friend T cross(const Vec2D& l, const Vec2D& r){ return l.x*r.y-l.y*r.x; }
    friend int dir(const Vec2D& l, const Vec2D& r)
    {
        // assert(norm(l)!=0);
        const auto c = cross(l,r);
        if(c>0) return 1;
        if(c<0) return -1;
        if(dot(l,r)<0) return -2;
        if(norm(l)<norm(r)) return 2;
        return 0;
    }
    bool upperArg()const{ return y>0 || (y==0 && x>0); }
    static bool cmpArg(const Vec2D& l, const Vec2D& r)
    {
        if(l.upperArg()==r.upperArg()) return dir(l,r)>0;
        return l.upperArg();
    }
};

static auto solve = []()
{
    int N; std::cin >> N;
    typedef Vec2D<long long> P;
    std::vector<P> p(N);
    for(auto&v:p) std::cin >> v.x >> v.y;
    for(int i=0; i<N; ++i)
    {
        std::vector<P> a; a.reserve(N-1);
        for(int j=0; j<N; ++j) if(j!=i)
            a.emplace_back(p[j]-p[i]);
        std::sort(a.begin(),a.end(),P::cmpArg);
        int m=std::numeric_limits<int>::max();
        std::vector<P> b; b.reserve(N-1);
        int k=0;
        for(int j=0; j<N-1; ++j)
        {
            if(k%(N-1)==j) ++k;
            const auto& v = a[j];
            const P iv(-v.x,-v.y);
            auto cmp = [&v,&iv](const P& u){
                if(iv.upperArg()==u.upperArg()) return dir(iv,u)<0;
                return dir(v,u)==1;
            };
            while(k%(N-1)!=j && cmp(a[k%(N-1)])) ++k;
            m = std::min(m,k-j-1);
        }
        std::cout << (N<=1?0:m) << '\n';
    }
};

int main()
{
    std::cin.tie(0);
    std::ios_base::sync_with_stdio(false);
    int T; std::cin >> T;
    for (int i=1; i<=T; ++i)
        std::cout << "Case #" << i << ":\n", solve();
}
