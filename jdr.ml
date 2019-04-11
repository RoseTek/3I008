  (* PERSONNAGE *)

type class_type = Archer | Barbare | Magicien;;
type objets = Pieces | Poulet | Eponges;;
type entry_sac = objets * int;;
type sac_type = {entries : entry_sac list};;      
type personnage = {classe:class_type ; xp:int ; sac:entry_sac list};;

  (* DECLARER HERO *)
let my_hero = ref { classe=Archer ; xp=2 ; sac=[]};;

  (* AJOUT D'UN OBJET AU SAC SIMPLE -- A AMELIORER --*)
let ajout_objet hero item =
  hero := { classe=(!hero).classe ; xp=(!hero).xp ; sac=(List.append (!hero).sac [item,1])  }
;;


  (* AFFICHER LES OBJETS DU SAC *)
let print_objets item =  
  match item with
  | (Pieces, nb) -> print_int nb; print_string " piece" ;
      if nb>1 then print_string "s\n" else print_string "\n"
  | (Poulet, nb) -> print_int nb; print_string " poulet" ;
      if nb>1 then print_string "s\n" else print_string "\n"
  | (Eponges, nb) -> print_int nb; print_string " eponge" ;
      if nb>1 then print_string "s\n" else print_string "\n"
;;

let rec affiche_sac_rec sac =
  match sac with
  | [] -> print_string "\n"
  | h::t -> print_objets h ; affiche_sac_rec t
;;

let affiche_contenu_sac hero = affiche_sac_rec (!hero).sac;;


  (* MONSTRE *)
type race_type = Golem | Sanglier | Moustique;;
type monstre = {race:race_type ; taille:int ; drop:objets};;

  (* GENERATION ALEATOIRE DE MONSTRE *)
let randomRace id =
  match id with
  | 0 -> Golem
  | 1 -> Sanglier
  | _ -> Moustique
;;

let randomDrop id =
  match id with
  | 0 -> Poulet
  | 1 -> Pieces
  | _ -> Eponges
;;

let genere_monstre race size drop =
  let my_race = randomRace race in
  let my_drop = randomDrop drop in
  let my_size = if my_race = Moustique then (size+1) else 1 in
  Random.self_init () ; { race=my_race ; taille=my_size; drop=my_drop}
;;


  (* TESTS *)
let my_hero = ref { classe=Archer ; xp=2 ; sac=[]};;
my_hero;;
ajout_objet my_hero Pieces;;
ajout_objet my_hero Poulet;;
my_hero;;
affiche_contenu_sac my_hero;;
(* utilise 4 pour augmenter l'apparition de moustiques *)
genere_monstre (Random.int 4) (Random.int 10) (Random.int 3);;
genere_monstre (Random.int 4) (Random.int 10) (Random.int 3);;
genere_monstre (Random.int 4) (Random.int 10) (Random.int 3);;
genere_monstre (Random.int 4) (Random.int 10) (Random.int 3);;






