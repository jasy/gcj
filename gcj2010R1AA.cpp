#include <iostream>
#include <string>

enum{ MAX = 50 };

static void ini( const int N, char p[MAX][MAX] ) {
	for (int i=0; i<N; ++i) {
		for (int j=0; j<N; ++j) {
			p[i][j] = '.';
		}
	}
}

static void rotgrv( const int N, const char b[MAX][MAX], char c[MAX][MAX] ) {
	ini( N, c );
	for (int y=0; y<N; ++y) {
		int n=N-1;
		for (int x=N-1; x>=0; --x) {
			if ( b[y][x] != '.' ) {
				c[n][N-1-y] = b[y][x];
				--n;
			}
		}
	}
}

bool isK( const int N, const int K, const char t, const char p[MAX][MAX] ) {
	const struct{ int dx; int dy; } d[] = { {1,0}, {0,1}, {1,1}, {1,-1} };
	for (int x=0; x<N; ++x) {
		for (int y=0; y<N; ++y) {
			if (t==p[x][y]) {
				const int n = sizeof(d)/sizeof(d[0]);
				for (int i=0; i<n; ++i) {
					bool f = true;
					for (int j=1; j<K; ++j) {
						const int x_ = x+d[i].dx*j;
						const int y_ = y+d[i].dy*j;
						if (x_<0 || N<=x_ || y_<0 || N<=y_ || t!=p[x_][y_]) {
							f = false;
							break;
						}
					}
					if (f) {
						return true;
					}
				}
			}
		}
	}
	return false;
}

static void solve(const int x) {
	int N,K;
	std::cin >> N >> K;
	char p[MAX][MAX];
	for (int i=0; i<N; ++i) {
		for (int j=0; j<N; ++j) {
			std::cin >> p[i][j];
		}
	}
	char c[MAX][MAX];
	bool r,b;
	rotgrv( N, p, c );
	r = isK( N, K, 'R', c );
	b = isK( N, K, 'B', c );
	std::string y;
	if (r&&b) {
		y = "Both";
	}
	else if(r) {
		y = "Red";
	}
	else if(b) {
		y = "Blue";
	}
	else {
		y = "Neither";
	}

	std::cout << "Case #" << x << ": " << y << "\n";
}

int main () {
	int T;
	std::cin >> T;
	for (int x=1; x<=T; ++x) {
		solve(x);
	}
	return 0;
}
