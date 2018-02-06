#! /bin/bash

ocamlc -o my_exec *.ml
rm -f *.cmi *.cmo
./my_exec 1 2 3 4 5 6 
rm -f my_exec
