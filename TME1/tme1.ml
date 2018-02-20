
(* HELLO WORLD *)
print_string "hello world!\n" ;;

(* ------------------------------------------------------------------------- *)

(* ECHO *)
let rec ech n =
  print_string (Sys.argv.(n) ^ " ");
  if n < (Array.length Sys.argv-1) then  ech (n+1)
  else print_string ("\n");;
ech 1;;

(* ------------------------------------------------------------------------- *)

(* SOMME *)
let size = Array.length Sys.argv-1;;
let meh =
  let rec loop n r =
    if n < size then loop (n+1) ((float_of_string Sys.argv.(n)) +. r)
    else  ((float_of_string Sys.argv.(n)) +. r);
  in
  loop 1 0. ;;
print_string ("Somme :" ^(string_of_float meh));;

(* ------------------------------------------------------------------------- *)

(* CAT *)
let my_cat =
  try
    while true do
      print_string (read_line () ^ "\n");
    done
  with
    End_of_file -> print_string ""
;;

(* ------------------------------------------------------------------------- *)

(* TR *)
(* ... *)
