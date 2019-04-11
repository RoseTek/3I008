type couleur = Pique | Coeur | Carreau | Trefle;;

type carte = As of couleur
  | Roi of couleur
  | Dame of couleur
  | Valet of couleur
  | Petite of couleur * int
;;

let valeur couleur_atout card =
  match card with
  | As _ -> 11
  | Roi _ -> 4
  | Dame _ ->3
  | Valet color -> if color = couleur_atout then 20 else 2
  | Petite (_,10) -> 10
  | Petite (color,9) -> if color = couleur_atout then 14 else 0
  | _ -> 0
;;

let rec test_deck deck atout =
  match deck with
  | [] -> 0
  | h::t -> (valeur atout h) + (test_deck t atout)
;;

let jeu = [Valet Carreau ; Petite (Trefle,10) ; Petite (Coeur,7) ; Petite (Carreau,8) ; Petite (Pique,9)];;

let mon_jeu = test_deck jeu Carreau;;
