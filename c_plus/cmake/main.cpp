#include <iostream>

#include <shareadlib.h>
#include <staticlib.h>

int main() {

    std::cout << "hello world." << std::endl;
    
    shareadlib_test();
    staticlib_test();

    return 0;
}