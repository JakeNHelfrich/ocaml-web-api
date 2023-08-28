FROM alpine:3.18.3 as base
RUN apk add build-base opam git libev-dev pkgconfig openssl-dev bash
RUN opam init -y --jobs=1

FROM base AS dune
RUN opam install dune

FROM dune AS build
WORKDIR /app
COPY . /app
RUN eval $(opam env) \
    && opam install -y /app/api.opam \
    && dune build 

FROM base AS runtime
WORKDIR /app
COPY --from=build /app/_build .
CMD ["./default/src/main.exe"]
