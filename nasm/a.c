#include <stdio.h>

void a1() {
	static int acc = 0;
	acc++;
	printf("%i\n", acc);
	a1();
}
int main() {
	a1();
	return 0;
}
