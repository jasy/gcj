#include <iostream>

using namespace std;

static long solve() {
	char mat[40][40];
	int lv[40];
	int N;
	cin >> N;
	for (int i=0; i<N; ++i) {
		for (int j=0; j<N; ++j) {
			cin >> mat[i][j];
		}
	}
	for (int i=0; i<N; ++i) {
		lv[i]=0;
		for (int j=N-1; j>=0; --j) {
			if ('1'==mat[i][j]) {
				lv[i]=j;
				break;
			}
		}
	}
	int cnt=0;
	for (int i=0; i<N; ++i) {
		if (lv[i]>i) {
			for (int j=i+1; j<N; ++j) {
				if (lv[j]<=i) {
					cnt += j-i;
					const int t = lv[j];
					for (int k=j; k>i; --k) {
						lv[k] = lv[k-1];
					}
					lv[i] = t;
					break;
				}
			}
		}
	}
	return cnt;
}

int main () {
    int N;
	cin >> N;
	for (int i=0; i<N; ++i) {
		cout << "Case #" << i+1 << ": " << solve() << "\n";
	}
    return 0;
}
