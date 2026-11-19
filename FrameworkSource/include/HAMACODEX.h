#pragma once

/* Marks a symbol as part of the public ABI of libHAMACODEX.dylib. */
#define HAMACODEX_API __attribute__((visibility("default")))

#ifdef __cplusplus
#include <string>

namespace HAMACODEX {

class HAMACODEX_API Counter {
public:
    explicit Counter(int start = 0);
    int increment();
    int value() const;

private:
    int value_;
};

HAMACODEX_API std::string greet(const std::string &name);

} // namespace HAMACODEX

extern "C" {
#endif

/* Plain C entry points — easy to call from any language or via dlopen(). */
HAMACODEX_API int HAMACODEX_add(int a, int b);
HAMACODEX_API const char *HAMACODEX_version(void);

#ifdef __cplusplus
}
#endif
