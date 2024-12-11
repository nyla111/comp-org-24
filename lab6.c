#include <stdio.h>

int calculate(int a, int b, int c, int d) {
    return a * b + c / d;
}

int main() {
    int x = 7, y = 8, z = 10, t = 5;
    int result;

    result = calculate(x, y, z, t);

    printf("The result of %d * %d + %d / %d is: %d\n", x, y, z, t, result);

    return 0;
}
