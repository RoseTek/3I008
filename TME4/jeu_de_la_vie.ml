
  (* TYPE SOME REPRESENTANT UNE CELLULE *)
type cell = Alive | Dead;;
type grid = cell array array;;

  (* PREMIERE GENERATION *)
let init_gen = [| [|Alive ; Dead|] ; [|Dead; Alive|] |] ;;	    
let init_gen = [| [|Alive ; Alive ; Dead ; Alive|] ;
		  [|Alive ; Dead ; Alive ; Dead|] ;
		  [|Dead ; Dead ; Dead ; Alive|] ;
		  [|Alive ; Alive ; Dead ; Dead|] |]
;;
		 
  (* AFFICHAGE *)
let affiche tab =
  for ligne = 0 to Array.length tab - 1 do
      for col = 0  to Array.length tab.(0) - 1 do
	if (tab.(ligne).(col) = Alive) then
	  print_string ("X")
	else
	  print_string ("_")
      done;
      print_string ("\n")
  done;
;;


  (* GENERATION NOUVELLE GENERATION *)
let next_gen tab =
  let tmp = Array.make_matrix (Array.length tab) (Array.length tab.(0)) Dead in
  let total = ref 0 in
    (* RENVOIE LE NB DE VOISINS VIVANTS *)
  let neighbours tab i j =
    if i > 0 && tab.(i - 1).(j) = Alive then total := !total + 1;
    if i < Array.length tab - 1 && tab.(i + 1).(j) = Alive then total := !total + 1;
    if j > 0 && tab.(i).(j-1) = Alive then total := !total + 1;
    if j < Array.length tab.(0) - 1 && tab.(i).(j + 1) = Alive then total := !total + 1;
    !total	       
  in
  for ligne = 0 to Array.length tab - 1 do
    for col = 0  to Array.length tab.(0) - 1 do
      (tmp).(ligne).(col) <- (tab).(ligne).(col);
      if (tab.(ligne).(col) = Alive) then
	(
	  if (neighbours tab ligne col < 2 || (total := 0 ; neighbours tab ligne col > 3)) then
	    (tmp).(ligne).(col) <- Dead;
  	  total := 0;
	)
      else
	(
	  if (neighbours tab ligne col = 3) then
	    (tmp).(ligne).(col) <- Alive;
  	  total := 0;
	)
    done;
  done;
  tmp;
;;


  (* FONCTION CONTINUE *)

  

  (* TESTS *)
let init_gen = [| [|Alive ; Alive ; Dead ; Alive|] ;
		  [|Alive ; Dead ; Alive ; Dead|] ;
		  [|Dead ; Dead ; Dead ; Alive|] ;
		  [|Alive ; Alive ; Dead ; Dead|] |];;
let meh = next_gen init_gen;;
affiche init_gen ;;
affiche meh;;
(* new_array = next_gen init_gen *)		       
(* let my_cell = Alive;; *)
(* match my_cell with *)
(* | Alive -> ... *)
(* | Dead -> ... *)

