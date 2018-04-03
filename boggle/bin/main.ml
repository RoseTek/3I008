open Boggle
       
(* n'ayant pas réussit à terminer le projet,
   le main contient des exemples de 
   fonctionnalités implémentées de board *)

       
exception MyEx;;
  
let board = Board.make 10 ( RandomLetter.picker RandomLetter.Distribution.fr );;
let _ =  Board.print board;;

let board_string = Board.from_string "atrseulcnmtehtsc";;
let get_board b =
  match b with
  | None -> raise MyEx
  | Some bo -> bo;;
let _ = Board.print (get_board board_string);;
let _ = Board.neighbours (get_board board_string) (1,1);;





       (* let main () = *)
(*   if Array.length Sys.argv >= 2 *)
(*   then begin *)
(*     print_string "J'ai reçu le paramètre "; *)
(*     print_endline Sys.argv.(1); *)
(*   end *)
(*   else begin *)
(*     print_endline "Je n'ai reçu aucun paramètre" *)
(*   end; *)
(*   print_endline "Je ne sais pas quoi faire... Programmez moi !" *)

