  (* ----------- CHERCHER UN CARACTERE ------------ *)

(* VERSION PERSO *)
  
let cherche_car str car =
  let rec aux acc =
    if (String.length str) <= acc then
      -1
    else
      if (String.get str acc) = car then
	acc
      else
	aux (acc + 1)
  in
  aux 0;;


(* VERSION INSPIREE DU MODULE STRING *)

let rec cherche_char_rec str index_max index char =
  if index >= index_max then -1
  else
    if String.get str index = char then index
    else cherche_char_rec str index_max (index + 1) char;;

let cherche_char str char = cherche_char_rec str (String.length str) 0 char;;

 (* ---------- AJOUTER DES ESPACES DANS UNE CHAINE ----------- *)
let ad_space str = 
  let var = ref "" in
  let fonction char =
    if (char = '.' || char = ',') then
      var := (!var ^ (String.make 1 char) ^ " ")
    else
      var := (!var ^ (String.make 1 char));
  in
  String.iter fonction str;
  !var
;;

ad_space "mot wow,c'est cool. haha";;  

