
(* CALCUL_PREFIXE *)
let rec calcul_prefixe l =
  match l with
  | [] -> 0
  | [x] -> 1
  | f::s::l when f = s -> 1 + calcul_prefixe (s::l)
  | _ -> 1
;;
  
(* GENERE_LISTE SUIVANTE*)
(* SKIP tous les elem h dans la liste t et la retourne *)
let rec skip elem list =
  match list with
  | [] -> []
  | h::t when h = elem -> skip elem t
  | _ -> list
;;
  
let rec genere_liste l =
  match l with
  | [] -> []
  | h::t -> (calcul_prefixe l)::h::(genere_liste (skip h t))
;;

let rec genere_bis k =
  if k = 1 then [1]
  else
    (genere_liste (genere_bis (k-1)))
;;

(* let make_list size = *)
(*   let rec aux size acc = *)
(*     if size <= 0 then [42] :: [acc] *)
(* 			(\* else aux (size - 1) *\) *)
(*     else (aux (size-1) (genere_bis size)::[acc]) *)
(*   in *)
(*   aux size (genere_bis 1) *)
(* ;; *)

(*   [42;42]::[(genere_bis 2)];; *)
(*   (genere_bis 1)::[(genere_bis 2)];; *)
(*       [[(genere_bis 1)]::[(genere_bis 2)]::[(genere_bis 3)]];; *)



(* let bordel_de_merde taille = *)  
let a =  genere_bis 4 :: [genere_bis 5];;
let a = genere_bis 3 :: a;;
let a = genere_bis 2 :: a;;

(* let a = ref [] ;; *)

  
  (* for i = 10 downto 1 do *)
  (*   print_string "mourir\n"; *)
  (*   let a = (genere_bis i) :: a; *)
  (* 	       (\* let a = genere_bis 2 :: a *\) *)
  (* done *)



(* let a = ref (genere_bis 1 :: [genere_bis 2]);; *)
  
(*   a := !a;; *)
