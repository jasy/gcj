#include <iostream>
#include <string>
#include <vector>
#include <list>
using namespace std;

static void get_num( int* w, int* q, int* n )
{
	string str;
	getline( cin, str );
	vector<int> v;
	const int len = str.length();
	int number=0;
	for (int i=0; i < len; ++i) {
		if ( str[i] == ' ' ) {
			v.push_back( number );
			number = 0;
			continue;
		}
		number = number*10+(str[i]-'0');
	}
	*w = v[0];
	*q = v[1];
	*n = number;
}

static void get_txt( const int n, list<string>& c ) 
{
	string str;
	for (int i=0; i<n; ++i) {
		getline( cin, str );
		c.push_back(str);
	}
}

static void get_extxt( const int n, list< list<string> >& c )
{
	list<string> txt_list;
	get_txt( n, txt_list );
	typedef list<string>::iterator Iter;
	Iter end=txt_list.end();
	for (Iter it=txt_list.begin(); it!=end; ++it) {
		list<string> v;
		string& str = *it;
		const int len = str.length();
		for (int i=0; i<len; ++i) {
			int base = i;
			int subs = 1;
			if (str[i] == '(') {
				const int b = str.find( ')', i+1 );
				subs = b-i-1;
				base = i+1;
				i = b;
			}
			v.push_back(str.substr(base, subs));
		}
		c.push_back(v);
	}
}

static bool check_match( string& txt, list<string>& extxt )
{
	bool match = true;
	typedef list<string>::iterator Iter;
	Iter end = extxt.end();
	int i=0;
	for (Iter it=extxt.begin(); it!=end; ++it,++i) {
		string& str = *it;
		if( string::npos == str.find(txt[i]) )
		{
			match = false;
			break;
		}
	}
	return match;
}

static int count_match( list<string>& txt_list, list<string>& extxt )
{
	int n = 0;
	typedef list<string>::iterator Iter;
	Iter end = txt_list.end();
	for (Iter it=txt_list.begin(); it!=end; ++it) {
		if (check_match(*it, extxt)) {
			++n;
		}
	}
	return n;
}

int main () {
	int w = 0;
	int q = 0;
	int n = 0;
	list<string> txt_list;
	list< list<string> > ex_txt;
	get_num( &w, &q, &n );
	get_txt( q, txt_list );
	get_extxt( n, ex_txt );
	int i=1;
	typedef list< list<string> >::iterator Iter;
	Iter end = ex_txt.end();
	for (Iter it=ex_txt.begin(); it!=end; ++it,++i) {
		cout << "Case #" << i << ": " << count_match(txt_list, *it) << "\n";
	}
    return 0;
}
