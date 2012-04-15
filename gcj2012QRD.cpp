#include <iostream>
#include <vector>
#include <string>
#include <set>

static int gcd(int a, int b)
{
    while (b) {
        const int t = a%b;
        a = b;
        b = t;
    }
    return a;
}

static int solve_small(const int H, const int W, const int D, const int xh, const int xw)
{
    int n = 0;
    std::set<std::pair<int,int> > l;
    const int D2 = D*D;
    const int dh = (D+H-1)/H;
    const int dw = (D+W-1)/W;
    const int ch = 2*xh-H+1;
    const int cw = 2*xw-W+1;
    for (int i=-dh; i<=dh; ++i) {
        for (int j=-dw; j<=dw; ++j) {
            const int dy = H * i + (i&1) * ch;
            const int dx = W * j + (j&1) * cw;
            if( dx*dx + dy*dy <= D2 && !(0==dx && 0==dy) ) {
                const int g = gcd(std::abs(dx),std::abs(dy));
                const std::pair<int,int> p = std::make_pair(dx/g,dy/g);
                if (!l.count(p)) {
                    l.insert(p);
                    ++n;
                }
            }
        }
    }
    return n;
}

static int solve ()
{
    int H,W,D;
    std::cin >> H >> W >> D;
    std::vector<std::string> m(H);
    for (int i=0; i<H; ++i) {
        std::cin >> m[i];
    }
    int xh,xw;
    for (int i=0; i<H; ++i) {
        for (int j=0; j<W; ++j) {
            if( 'X' == m[i][j] ) {
                xh = i;
                xw = j;
            }
        }
    }
    return solve_small(H-2,W-2,D,xh-1,xw-1);
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
