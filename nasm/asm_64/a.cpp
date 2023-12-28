#include <cstring>
#include <iostream>
int main() {
	using namespace std;

	int i1 = 5;
	i1 = (++i1) + (++i1);
	cout << "Hello world" << endl;

	size_t i = 1;
	size_t b = 2;
	size_t c = 3;
	string ss;

	if (c == 3) {
		ss = "Govno";
	}
	else  {
		ss = "wer";
	}
	cout << ss << endl;


	for (;i < 10; i++) {
		b*=i;
	}

	return 0;
}
