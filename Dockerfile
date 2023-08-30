FROM alpine:3.18.3 as base
RUN apk add build-base opam git libev-dev pkgconfig openssl-dev bash rsync
RUN opam init -y --jobs=1

FROM base AS dune
RUN opam install dune

FROM dune AS depenencies
WORKDIR /app
COPY ./api.opam ./dune-project /app
RUN eval $(opam env) \
    && opam install -y /app/api.opam \
    && dune build

FROM depenencies as build
COPY ./src /app/src
RUN eval $(opam env) \
    && dune build

FROM base AS runtime
WORKDIR /app
COPY --from=build /app/_build .
CMD ["./default/src/main.exe"]
