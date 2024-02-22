#include <iostream>
#include <thread>
#include <chrono>
#include <string>
#include <emscripten/bind.h>

using namespace emscripten;

// int main()
// {
//     while(true)
//     {
//         std::cout << "Hello, World!" << std::endl;
//         std::this_thread::sleep_for(std::chrono::seconds(1));
//     }
//     return 0;
// }

std::string hello()
{
    return "Hello, World!";
}

EMSCRIPTEN_BINDINGS(test_module){
    function("hello",&hello);
}