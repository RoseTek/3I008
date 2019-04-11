let compteur () =
  let n = ref 0 in
  (fun () -> n:= !n+1 ; !n) ,
  (fun () -> n := 0)
let cpt,reset  = compteur ()

		   
let win = Dom_html.window
let opt = Dom_html.CoerceTo.button (Dom_html.getElementById "btn_click")
let text = Js.Opt.get opt (fun () -> win##alert (Js.string "elem n'existe pas") ; failwith "erreur" )


(* ALERT *)
let btn_alert = Dom_html.getElementById "btn_alert"
let alert_handler = Dom_html.handler ( fun event -> win##alert (Js.string "Alert") ;
						    Js._true)

(* CLICK *)
let btn_click = Dom_html.getElementById "btn_click"
let click_number = Dom_html.getElementById "click_number"
let click_handler = Dom_html.handler ( fun event ->
				       let value = cpt () in 
				       click_number##.innerHTML := Js.string (string_of_int (value)) ;
				       if value = 10 then
					 begin
					   text##.disabled := Js._true ;
					   ()
					 end;
				       Js._true
				     )

(* RESET *)
let btn_reset = Dom_html.getElementById "btn_reset"
let reset_handler = Dom_html.handler ( fun event -> reset () ;
						    click_number##.innerHTML := Js.string "0" ;
						    text##.disabled := Js._false ;
						    Js._true)
				     
				     
let () =
  btn_alert##.onclick := alert_handler ;
  btn_click##.onclick := click_handler ; 
  btn_reset##.onclick := reset_handler ;
