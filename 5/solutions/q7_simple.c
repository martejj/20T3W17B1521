
int main(void) {
    int i = 0;
    int numbers[10] = {0,1,2,-3,4,-5,6,-7,8,9};

    loop:
        if (i >= 10) goto end;

        if (numbers[i] >= 0) goto nothing;
            numbers[i] += 42;
        nothing:

        i++;
        goto loop;
    end:
}