#include <iostream>
#include "HAMACODEX.h"

int main() {
    HAMACODEX::Counter counter(41);
    std::cout << HAMACODEX::greet("world") << "\n";
    std::cout << "counter: " << counter.increment() << "\n";
    std::cout << "2 + 3 = " << HAMACODEX_add(2, 3) << "\n";
    std::cout << "version: " << HAMACODEX_version() << "\n";
    return 0;
}
