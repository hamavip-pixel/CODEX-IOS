#include "HAMACODEX.h"

namespace HAMACODEX {

Counter::Counter(int start) : value_(start) {}

int Counter::increment() { return ++value_; }

int Counter::value() const { return value_; }

std::string greet(const std::string &name) {
    return "Hello, " + name + " from libHAMACODEX!";
}

} // namespace HAMACODEX

extern "C" {

int HAMACODEX_add(int a, int b) { return a + b; }

const char *HAMACODEX_version(void) { return "1.0.0"; }

}
