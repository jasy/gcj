#include <iostream>
#include <vector>

typedef std::vector<int> vl_type;
typedef std::vector<vl_type> v_type;
typedef std::vector<char> vcl_type;
typedef std::vector<vcl_type> vc_type;

enum{ North, West, East, South, DMAX };
static const struct{ int dh; int dw; } dir[DMAX] = { {-1,0}, {0,-1}, {0,1}, {1,0} };

static char solve(const v_type& v, vc_type& vc, const int h, const int w, const char c) {
    const int H = v.size();
    const int W = v[0].size();
    char mc = vc[h][w];
    if (!mc) {
        mc = vc[h][w] = c;
        const int mv = v[h][w];
        int m = mv;
        int d = DMAX;
        for (int i=0; i<DMAX; ++i) {
            const int nh = h+dir[i].dh;
            const int nw = w+dir[i].dw;
            if (0<=nh && nh<H && 0<=nw && nw<W) {
                const int n = v[nh][nw];
                if (n<m) {
                    m = n;
                    d = i;
                }
            }
        }
        if (DMAX == d) {
            return mc;
        }
        else {
            return vc[h][w] = solve(v,vc,h+dir[d].dh,w+dir[d].dw,mc);
        }
    }
    else if( mc <= c ) {
        return mc;
    }
    else {
        vc[h][w] = c;
        for (int i=0; i<DMAX; ++i) {
            const int nh = h+dir[i].dh;
            const int nw = w+dir[i].dw;
            if (0<=nh && nh<H && 0<=nw && nw<W) {
                const int n = vc[nh][nw];
                if (n==mc) {
                    solve(v,vc,nh,nw,c);
                }
            }        }
        return c;
    }
}

static void solve(const int t) {
    int H,W;
    std::cin >> H >> W;
    v_type v(H,vl_type(W));
    for (int h=0; h<H; ++h) {
        for (int w=0; w<W; ++w) {
            std::cin >> v[h][w];
        }
    }
    vc_type vc(H,vcl_type(W,0));
    char c = 'a';
    for (int h=0; h<H; ++h) {
        for (int w=0; w<W; ++w) {
            if( solve(v,vc,h,w,c) == c ) ++c;
        }
    }
    std::cout << "Case #" << t << ":\n";
    for (int h=0; h<H; ++h) {
        for (int w=0; w<W; ++w) {
            if (w!=0) {
                std::cout << " ";
            }
            std::cout << vc[h][w];
        }
        std::cout << "\n";
    }
}

int main ()
{
    int T;
    std::cin >> T;
    for (int i=1; i<=T; ++i) {
        solve(i);
    }
    return 0;
}
