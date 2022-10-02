#include <iostream>
#include "picosha2.h"
#include <string>

extern "C" int LLVMFuzzerTestOneInput(const uint8_t *data, size_t size){
    std::string buf(reinterpret_cast<const char*>(data), size);
    buf.push_back('\0');
    picosha2::hash256_hex_string(buf.c_str());
    return 0;
}
