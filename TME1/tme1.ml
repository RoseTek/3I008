
(* HELLO WORLD *)
(* print_string "hello world!\n" ;; *)

(* ------------------------------------------------------------------------- *)

(* ECHO *)
(* let rec ech n = *)
(*   print_string (Sys.argv.(n) ^ " "); *)
(*   if n < (Array.length Sys.argv-1) then  ech (n+1) *)
(*   else print_string ("\n");; *)
(* ech 1;; *)

(* ------------------------------------------------------------------------- *)

(* SOMME *)
(* let size = Array.length Sys.argv-1;; *)
(* let meh = *)
(*   let rec loop n r = *)
(*     (\* print_string ("Ici r cumulé: " ^ (string_of_float r) ^"\n"); *\) *)
(*     (\* print_string ((string_of_int n) ^"/ " ^ (string_of_int size) ^"\n"); *\) *)
(*     if n < size then loop (n+1) ((float_of_string Sys.argv.(n)) +. r) *)
(*     else  ((float_of_string Sys.argv.(n)) +. r); *)
(*   in *)
(*   loop 1 0. ;; *)
(* print_string ("Somme :" ^(string_of_float meh));; *)

(* ------------------------------------------------------------------------- *)

(* CAT *)
(* let my_cat = *)
(*   try *)
(*     while true do *)
(*       print_string (read_line () ^ "\n"); *)
(*     done    *)
(*   with *)
(*     End_of_file -> print_string "" *)
(* ;;   *)

(* ------------------------------------------------------------------------- *)

(* Tentative de TR (???) *)
(* let pattern = "pattern ?";; *)

(* let replace line = *)
(*   print_string (line ^ " filtre avec " ^ pattern ^ "\n"); *)
(* ;; *)

(* let my_tr = *)
(*   try *)
(*     while true do *)
(*       let line = read_line () in *)
(*       replace line; *)
(*     done *)
(*   with *)
(*     End_of_file -> print_string "" *)
(* ;; *)
  

(* print_string ("\n");; *)
