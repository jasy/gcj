#include <iostream>
#include <sstream>
#include <iomanip>
#include <vector>
#include <bitset>
#include <string>

typedef std::bitset<512> v_type;

static void solve( const int x ) {
	int N,M;
	std::cin >> N >> M;
	std::vector<v_type> b(N);
	for (int i=0; i<N; ++i) {
		std::string s;
		std::cin >> s;
		for (int n=0; n<M; n+=32) {
			unsigned long l;
			std::stringstream ss(s.substr(0,8));
			s.erase(0,8);
			ss >> std::hex >> l;
			if (n+32>M) {
				l <<= 32-M%32;
			}
			for (int bit=0; bit<((n+32>M)?M%32:32); ++bit) {
				b[i].set( n+bit, l&(1<<(31-bit)) );
			}
		}
	}
	int K=0;
	std::vector<v_type> u(N);
	std::vector<int> k(std::min(N,M)+1);
	for (int i=std::min(N,M); i>0; --i) {
		for (int n=0; n<=N-i; ++n) {
			for (int m=0; m<=M-i; ++m) {
				bool strip = true;
				const bool c = b[n][m];
				for (int ni=0; ni<i; ++ni) {
					for (int mi=0; mi<i; ++mi) {
						if (u[n+ni][m+mi] || ((b[n+ni][m+mi]==((ni+mi)&1))==c)) {
							strip = false;
							break;
						}
					}
					if (!strip) {
						break;
					}
				}
				if (strip) {
					if( 1==++k[i] ) {
						++K;
					}
					for (int ni=0; ni<i; ++ni) {
						for (int mi=0; mi<i; ++mi) {
							u[n+ni][m+mi] = true;
						}
					}
				}
			}
		}
	}
	std::cout << "Case #" << x << ": " << K << "\n";
	for (int i=std::min(N,M); i>0; --i) {
		if (k[i]) {
			std::cout << i << " " << k[i] << "\n";
		}
	}
}

int main () {
	int T;
	std::cin >> T;
	for (int x=1; x<=T; ++x) {
		solve( x );
	}
	return 0;
}
