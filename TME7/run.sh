#! /bin/sh

ocamlopt afficheur_generique.c afficheur_generique_caml.ml -o exec
./exec
rm *.o
rm *.cmx
rm *.cmi
