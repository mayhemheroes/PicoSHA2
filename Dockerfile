FROM ubuntu:22.04 AS builder

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y clang build-essential

ADD . /PicoSHA2
WORKDIR /PicoSHA2
ADD fuzzers/fuzz_picosha2_hex_string.cpp .
RUN clang++ -fsanitize=fuzzer,address fuzz_picosha2_hex_string.cpp -o /fuzz_picosha2_hex

FROM ubuntu:22.04
COPY --from=builder /fuzz_picosha2_hex /
