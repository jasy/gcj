#include <iostream>
#include <string>
#include <vector>
#include <cstdio>
#include <cmath>

using namespace std;

static void calc( int num )
{
	int n;
	double x=0, y=0, z=0, vx=0, vy=0, vz=0;
	cin >> n;
	for (int i=0; i<n; ++i) {
		int tx, ty, tz, tvx, tvy, tvz;
		cin >> tx >> ty >> tz >> tvx >> tvy >> tvz;
		x += tx;
		y += ty;
		z += tz;
		vx += tvx;
		vy += tvy;
		vz += tvz;
	}
	double d=0, t=0;
	const double a = vx*vx + vy*vy+ vz*vz;
	const double b = (x*vx+y*vy+z*vz)*2;
	const double c = x*x + y*y + z*z;
	const double b2_4ac = b*b - 4*a*c;
	if (0 != a) {
		if (0 == (b2_4ac)) {
			double sq = sqrt(b2_4ac);
			double x1 = (-b-sq)/(2*a);
			double x2 = (-b+sq)/(2*a);
			if (x1>=0) {
				t = x1;
			}
			else if (x2>=0) {
				t = x2;
			}
			else {
				t = 0;
			}
		}
		else {
			t = (-b)/(2*a);
			if (t<0) {
				t=0;
			}
		}
	}
	else {
		if (0 == b) {
			t=0;
		}
		else {
			t=(-c)/b;
		}

	}

	double px = x+vx*t;
	double py = y+vy*t;
	double pz = z+vz*t;
	double pt = px*px+py*py+pz*pz;
	double p = pt/n/n;
	d = sqrt(p);

	printf("Case #%d: %0.8f %0.8f\n", num, d, t);
}

int main () {
	int T;
	cin >> T;
	for (int i=0; i<T; ++i) {
		calc( i+1 );
	}
    return 0;
}
