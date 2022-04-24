#include <cstdio>
#include <iostream>
#include <fstream>
#include <cmath>
#include <vector>
/*
Sort(A,p,r)
 if p < r
    then           q := round_half_down((p+r)/2)
                       Sort(A,p,q)
                       Sort(A,q+1,r)
                       Merge(A,p,q,r)
*/
size_t* Merge(size_t*, size_t, size_t, size_t);

size_t* Sort(size_t*, size_t, size_t);


int main() {
	using namespace std;
	size_t arr[] = {5,2,4,6,1,3,2,6};

	size_t lengtharr = sizeof(arr) / sizeof(arr[0]);

	cout << lengtharr << endl;

	Sort(arr, 1, lengtharr);
	
	return 0;

}


size_t* Merge(size_t* A, size_t p, size_t q, size_t r) {


}


// p - fist index r - length or last index
size_t* Sort(size_t* A, size_t p, size_t r) {
	size_t* a;
	size_t* b;
	size_t* c;
	size_t q;

	using namespace std;

	ve
	if (p < r) {
		q = std::round((p+r)/2);
		a = Sort(A, p, q);
		b = Sort(A, q+1, r);
		c = Merge(A, p, q, r);
		return c;

	}
	return A;

	//printf();
	


}



