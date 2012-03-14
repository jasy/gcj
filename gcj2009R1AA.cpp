#include <iostream>
#include <sstream>
#include <string>
#include <vector>
#include <set>

using namespace std;

set<unsigned long long> sHappy[11];
set<unsigned long long> fHappy[11];
static bool isHappy( const unsigned long long no, const int base ) {
	set<unsigned long long> s;
	bool happy=true;
	unsigned long long n = no;
	while (1!=n) {
		if (sHappy[base].count(n)) {
			break;
		}
		if (s.count(n)||fHappy[base].count(n)) {
			happy=false;
			break;
		}
		s.insert( n );
		unsigned long long m=n;
		n=0;
		while (m>0) {
			const unsigned long long t = m/base;
			const unsigned long long d = m-t*base;
			n += d*d;
			m = t;
		}
	}
	if (happy) {
		sHappy[base].insert(s.begin(),s.end());
	}
	else {
		fHappy[base].insert(s.begin(),s.end());
	}

	return happy;
}

static unsigned long long solve() {
	string str;
	getline(cin, str);
	istringstream iss(str);
	int base;
	vector<int> bases;
	while (iss >> base) {
		bases.push_back( base );
	}
	unsigned long long no;
	bool happy;
	for(no=2; ;++no) {
		happy = true;
		for (int i=0; i<bases.size(); ++i) {
			if (!isHappy(no, bases[i])) {
				happy = false;
				break;
			}
		}
		if (happy) {
			break;
		}
	}
	return no;
}

int main () {
	string str;
	getline(cin, str);
	istringstream iss(str);
    int T;
	iss >> T;
	for (int i=0; i<T; ++i) {
		cout << "Case #" << i+1 << ": " << solve() << "\n";
	}
    return 0;
}
