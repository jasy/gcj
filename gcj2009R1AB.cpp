#include <iostream>
#include <vector>
#include <queue>
#include <set>
#include <climits>

using namespace std;

int N,M;

class State{
public:
	int x;
	int y;
	long t;
	int id;
	State( int x_, int y_, long t_): x(x_), y(y_), t(t_), id(y_*(M*2)+x_) {}
	bool operator<(const State& s) const {
		if (t!=s.t) {
			return t>=s.t;
		}
		if (y!=s.y) {
			return y>=s.y;
		}
		return x>=s.x;
	}
};

static long solve() {
	cin >> N >> M;
	vector<long> S(N*M);
	vector<long> W(N*M);
	vector<long> T(N*M);
	for (int y=0; y<N; ++y) {
		for (int x=0; x<M; ++x) {
			const int p = y*M+x;
			cin >> S[p] >> W[p] >> T[p];
		}
	}
	const int move[4][2] = {
		{-1, 0},
		{ 0,-1},
		{ 1, 0},
		{ 0, 1},
	};
	priority_queue<State> Q;
	set<int> V;
	State f( 0, 2*N-1, 0 );
	Q.push(f);
	while(!Q.empty()) {
		const State s = Q.top();
		Q.pop();
		if (V.count(s.id)) {
			continue;
		}
		V.insert(s.id);
		if (2*M-1==s.x && 0==s.y) {
			return s.t;
		}
		for (int i=0; i<4; ++i) {
			const int x_ = s.x + move[i][0];
			const int y_ = s.y + move[i][1];
			if ((x_<0 || M*2<=x_) || (y_<0 || N*2<=y_)) {
				continue;
			}
			State s_( x_, y_, s.t );
			if (V.count(s_.id)) {
				continue;
			}
			if (s.x!=x_) {
				if( s.x/2 != x_/2 ) {
					s_.t+=2;
				}
				else {
					const int p = (y_/2)*M+x_/2;
					const long Si = S[p];
					const long Wi = W[p];
					const long t = (s.t-T[p]%(Si+Wi)+(Si+Wi))%(Si+Wi);
					if (t<Si) {
						s_.t+=Si-t+1;
					}
					else {
						++s_.t;
					}
				}
			}
			else {
				if ( s.y/2 != y_/2 ) {
					s_.t+=2;
				}
				else {
					const int p = (y_/2)*M+x_/2;
					const long Si = S[p];
					const long Wi = W[p];
					const long t = (s.t-T[p]%(Si+Wi)+(Si+Wi))%(Si+Wi);
					if (t<Si) {
						++s_.t;
					}
					else {
						s_.t+=Si+Wi-t+1;
					}
				}

			}
			Q.push(s_);
		}
	}
	return -1;
}

int main () {
    int C;
	cin >> C;
	for (int i=0; i<C; ++i) {
		cout << "Case #" << i+1 << ": " << solve() << "\n";
	}
    return 0;
}
