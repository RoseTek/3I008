  (* DEFINITION TYPE *)
type node = Lettre of char * bool * arbre_lex
 and arbre_lex = node list
;;


  (* EXISTE *)
let existe arbre mot =
  let rec existe_aux n = function
      Lettre (a,b,children) -> if n < (String.length mot -1) then a = String.get mot 1 && (List.exists(existe_aux(n+1)) children)
			       else if n = (String.length mot - 1) then a = String.get mot n && b
			       else false
  in
  List.exists (existe_aux 0) arbre
;;


exception Deja_defini;;

  (* AJOUTE *)
let ajoute dico mot =
  let rec traverse n nodes =
    if n < String.length mot then
      match nodes with
      | [] -> [Lettre((String.get mot n), n = String.length mot - 1, traverse (n+1) [])]
      | Lettre(a,true,children)::t when a = (String.get mot n) && n = (String.length mot - 1) -> raise Deja_defini
      | Lettre(a,b,children)::l when a = (String.get mot n) -> Lettre(a,b || n = String.length mot - 1, traverse (n+1) children)::l
      | lettre::l -> lettre::(traverse n l)
    else
      []
  in
  traverse 0 dico
;;


  (* CONSTRUIT *)
  (* LISTE_DE_DICT *)
  (* AFFICHE *)
  (* MANIP INTERRACTIVE DE DICO *)
  (* ENREGISTREMENT DANS FICHIER *)
