

  (* ---- renvoie le dernier element d'une liste ---- *)
exception ListeVide;;
  
let rec last list = match list with
  | [] -> raise ListeVide
  | [x] -> x
  | h::t -> last t
;;

  (* test *)
last  [ "a" ; "b" ; "c" ; "d" ];;
last  ["t"];;
last  [];;
last  [(7 , "meh") ; (14 , "pow") ; (42 , "hi")];;
last  [1 ; 2 ; 3 ; 4 ; 5 ; 8];;
  

(* ---- renvoie les deux derniers elements de la liste ---- *)
exception ListeTropCourte;;
  
let rec last_two list = match list with
  | [] -> raise ListeVide
  | [x] -> raise ListeTropCourte
  | [x;y] -> (x , y)
  | h::t -> last_two t
;;

  (* test *)
last_two  [ "a" ; "b" ; "c" ; "d" ];;
last_two  ["t"];;
last_two  [];;
last_two  [(7 , "meh") ; (14 , "pow") ; (42 , "hi")];;
last_two  [1 ; 2 ; 3 ; 4 ; 5 ; 8];;


(* ---- recode List.nth ---- *)
exception FailureNth;;

let rec my_list_nth list i = match list with
  | [] -> raise FailureNth
  | h::t -> if i <= 1 then h else my_list_nth t (i-1)
;;

my_list_nth  [ "a" ; "b" ; "c" ; "d" ] 2;;
my_list_nth  ["t"] 2;;
my_list_nth  [] 2;;
my_list_nth  [(7 , "meh") ; (14 , "pow") ; (42 , "hi")] 2;;
my_list_nth  [1 ; 2 ; 3 ; 4 ; 5 ; 8] 2;;


