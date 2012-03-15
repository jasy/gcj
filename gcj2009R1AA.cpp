#include <iostream>
#include <sstream>
#include <string>
#include <vector>

typedef unsigned long base_type;
static int memo[11][20000000] = {};
static int isHappy( const base_type no, const int base ) {
	if (1==no) {
		return 1;
	}
	if (memo[base][no]) {
		return memo[base][no];
	}
	base_type m=no;
	base_type n=0;
	while (m>0) {
		const base_type t = m%base;
		n += t*t;
		m /= base;
	}
	memo[base][no] = -1;
	return memo[base][no] = isHappy(n,base);
}

static base_type solve() {
	std::string str;
	std::getline(std::cin, str);
	std::istringstream iss(str);
	int base;
	std::vector<int> bases;
	while (iss >> base) {
		bases.push_back( base );
	}
	const int n = bases.size();
	base_type no;
	bool happy;
	for(no=2; ;++no) {
		happy = true;
		for (int i=0; i<n; ++i) {
			if (-1==isHappy(no, bases[i])) {
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
	std::string str;
	std::getline(std::cin, str);
	std::istringstream iss(str);
	int T;
	iss >> T;
	for (int i=1; i<=T; ++i) {
		std::cout << "Case #" << i << ": " << solve() << "\n";
	}
	return 0;
}
