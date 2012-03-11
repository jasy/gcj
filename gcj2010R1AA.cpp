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

static void grv( const int N, const char b[MAX][MAX], char c[MAX][MAX] ) {
	ini( N, c );
	for (int i=0; i<N; ++i) {
		int n=0;
		for (int j=0; j<N; ++j) {
			if( b[i][j] != '.' ) {
				c[i][n] = b[i][j];
				++n;
			}
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
	for (int i=N-1; i>=0; --i) {
		int n=0;
		for (int j=0; j<N; ++j) {
			char b = p[i][j];
			if (t==b) {
				++n;
				if (K<=n) {
					return true;
				}
			}
			else {
				n=0;
			}
		}
		n=0;
		for (int j=0; j<=i; ++j) {
			char b = p[i-j][j];
			if (t==b) {
				++n;
				if (K<=n) {
					return true;
				}
			}
			else {
				n=0;
			}
		}
		n=0;
		for (int j=0; j<N-i; ++j) {
			char b = p[i+j][j];
			if (t==b) {
				++n;
				if (K<=n) {
					return true;
				}
			}
			else {
				n=0;
			}
		}
	}
	for (int i=0; i<N; ++i) {
		int n=0;
		for (int j=N-1; j>=0; --j) {
			char b = p[j][i];
			if (t==b) {
				++n;
				if (K<=n) {
					return true;
				}
			}
			else {
				n=0;
			}
		}
		n=0;
		for (int j=0; j<=i; ++j) {
			char b = p[j][i-j];
			if (t==b) {
				++n;
				if (K<=n) {
					return true;
				}
			}
			else {
				n=0;
			}
		}
		n=0;
		for (int j=0; j<N-i; ++j) {
			char b = p[j][i+j];
			if (t==b) {
				++n;
				if (K<=n) {
					return true;
				}
			}
			else {
				n=0;
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
