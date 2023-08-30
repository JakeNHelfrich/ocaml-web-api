(lang dune 3.10)

(name api)

(generate_opam_files true)

(authors "Jake Helfrich")
(maintainers "Jake Helfrich")

(license NOLICENSE)

(package
 (name api)
 (synopsis "Ocaml API")
 (description "Ocaml API")
 (allow_empty)
 (depends dream ppx_yojson_conv))
