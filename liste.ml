
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

let gen k =
  let rec aux acc n =
    if n = 0 then acc
    else aux ((genere_bis n)::acc) (n-1) in
  aux [] k
;;


  (* test *)
gen 1;;
gen 2;;
gen 3;;
gen 4;;
