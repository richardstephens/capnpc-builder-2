FROM alpine:3.22.1

RUN apk add --no-cache zip curl linux-headers clang20 make

ENV CXX=clang++

RUN curl -O https://capnproto.org/capnproto-c++-1.2.0.tar.gz && \
    echo "ed00e44ecbbda5186bc78a41ba64a8dc4a861b5f8d4e822959b0144ae6fd42ef  capnproto-c++-1.2.0.tar.gz" | sha256sum -c && \
    tar zxvf capnproto-c++-1.2.0.tar.gz && \
    cd capnproto-c++-1.2.0 && \
    ./configure && \
    make -j8 check && \
    make install && \
    cd .. && \
    rm -rf capnproto-c++-1.2.0

RUN apk add --no-cache git

RUN git clone https://github.com/capnproto/capnproto-java.git && \
    cd capnproto-java && \
    git checkout 0fd8452dab167618e5074dfa900afdec7553f400 && \
    make && \
    make install && \
    cd .. && \
    rm -rf capnproto-java \
