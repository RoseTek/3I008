
external generic_print : 'a -> unit = "generic_print";;

generic_print 42;;
generic_print [1;2;3;4;5];;
generic_print "meh";;
generic_print 42.42;;
generic_print [| 1.1; 2.2; 3.3 |];;
generic_print generic_print;;
generic_print ["wow";"such"];;
  (* test abstract *)
  (* test custom *)

type compte = {nom:string; age:int; solde:float};;
generic_print {nom="Patrick" ; age=42; solde=851.1};;
let rec l = 1 :: l;;
generic_print l;;
generic_print [| 1; 2; 3 |];;
