FROM fuzzers/libfuzzer:12.0 as builder

RUN apt-get update
RUN apt install -y build-essential clang
ADD . /PicoSHA2
WORKDIR /PicoSHA2
ADD fuzzers/fuzz_picosha2_hex_string.cpp .
RUN clang++ -fsanitize=fuzzer,address fuzz_picosha2_hex_string.cpp -o /fuzz_picosha2_hex

FROM fuzzers/libfuzzer:12.0
COPY --from=builder /fuzz_picosha2_hex /

ENTRYPOINT []
CMD ["/fuzz_picosha2_hex"]
