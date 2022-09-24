#include <iostream>
#include "picosha2.h"
#include <string>

void CalcAndOutput(const std::string& src){
	std::cout << "src : \"" << src << "\"\n";
	std::cout << "hash: " << picosha2::hash256_hex_string(src) << "\n" << std::endl;
}

extern "C" int LLVMFuzzerTestOneInput(const uint8_t *data, size_t size){
    std::string buf(reinterpret_cast<const char*>(data), size);
    buf.push_back('\0');
    CalcAndOutput(buf.c_str());
    return 0;
}
