#include <iostream>
#include <string>
#include <vector>

using namespace std;

static int get_num( vector<int>& v )
{
	string str;
	getline( cin, str );
	const int len = str.length();
	int n=1;
	int number=0;
	for (int i=0; i < len; ++i) {
		if ( str[i] == ' ' ) {
			v.push_back( number );
			number = 0;
			++n;
			continue;
		}
		number = number*10+(str[i]-'0');
	}
	v.push_back( number );
//	return n;
	return number;
}

static int change( char c )
{
	if ('0'<= c && c <= '9') {
		return c-'0';
	}
	else {
		return c-'a'+10;
	}

}

static unsigned long long calc( const string& str )
{
	const int len = str.length();
	int base = 0;
	int use[36];
	int num[36];
	vector<int> v;
	for (int i=0; i<36; ++i) {
		use[i] = -1;
		num[i] = -1;
	}
	for (int i=0; i<len; ++i) {
		int k = change( str[i] );
		if (-1 == use[k]) {
			use[k] = i;
			if (base > 1) {
				num[k] = base;
			}
			else if( 1 == base ) {
				num[k] = 0;
			}
			else {
				num[k] = 1;
			}
			++base;
		}
		v.push_back( k );
	}
	if (1 == base) {
		base = 2;
	}
	unsigned long long unit = 1;
	unsigned long long sum = 0;
	for (int i=len-1; i>=0; --i) {
		int k = v[i];
		sum += num[k] * unit;
		unit *= base;
	}
	return sum;
}

int main () {
	vector<int> v;
	const int n = get_num( v );
	for (int i=0; i<n; ++i) {
		string str;
		getline( cin, str );
		cout << "Case #" << i+1 << ": " << calc( str ) << "\n";
	}
    return 0;
}
