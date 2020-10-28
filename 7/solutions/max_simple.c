#include <stdio.h>

int max(int a[], int length) {

    int first_element = a[0];

    if (length != 1) goto cont;

        return first_element;

    cont:;

        // find max value in rest of array
        int max_so_far = max(&a[1], length - 1);

        if (first_element < max_so_far) goto not_bigger;
            max_so_far = first_element;
        not_bigger:
        
        return max_so_far;

}

int main(void) {

    int nums[] = {1, 4, 3, 5, 2};
    int max_num = max(nums, 5);

    printf("%d", max_num);
    printf("%c", '\n');

    return 0;

}