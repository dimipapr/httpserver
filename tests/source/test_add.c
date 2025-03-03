#include "minunit.h"
#include "add.h"

MU_TEST(test_add){
    mu_assert(add(1,1)==2,"1+1 should be 2");
}
void suite_add_setup(void){
    printf("Setup\n");
}
void suite_add_teardown(void){
    printf("Teardown\n");
}

MU_TEST_SUITE(suite_add){
    MU_SUITE_CONFIGURE(&suite_add_setup, &suite_add_teardown);
    MU_RUN_TEST(test_add);
}

int main(int argc, char *argv[]){
    MU_RUN_SUITE(suite_add);
    MU_REPORT();
    return MU_EXIT_CODE;
}