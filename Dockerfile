FROM ocaml/opam:debian-10-ocaml-5.2 AS dune
RUN opam install dune

FROM dune AS build
WORKDIR /app
COPY . /app
RUN eval $(opam env) \
    && dune build 

FROM ocaml/opam:debian-10-ocaml-5.2 AS runtime
WORKDIR /app
CMD ["sh"]
COPY --from=build /app/_build .
CMD ["./default/src/main.exe"]
