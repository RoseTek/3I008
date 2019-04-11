#! /bin/bash

ocamlc /users/Enseignants/suzanne/.opam/4.06.0/lib/ocaml/graphics.cma affichage.ml -o bonheur
./bonheur
rm bonheur *.cmi *.cmo
