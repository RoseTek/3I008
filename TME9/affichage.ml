
(* #load "graphics.cma";; *)
open Graphics;;
      
class virtual shape =
    object (self)
      method virtual is_pixel_in : (int * int) -> bool
      val virtual col : color
      val virtual mutable pos : (int * int)
      method get_color () = col
      method get_pos () = pos
      method virtual move : (int * int) -> unit
    end;;

class carre c posc =
    object
      inherit shape
      val col = blue
      val mutable pos = posc
      method is_pixel_in pix = (fst pix) <= (c+(fst pos)) &&
				(fst pix) >= (fst pos) &&
				(snd pix) <= (c+(snd pos)) &&
				  (snd pix) >= (snd pos)
      method move decal = ()
    end;;


  class circle c posc =
    object
      inherit shape
      val col = yellow
      val mutable pos = posc
      method is_pixel_in pix = (fst pix) <= (c+(fst pos)) &&
				(fst pix) >= (fst pos) &&
				(snd pix) <= (c+(snd pos)) &&
				  (snd pix) >= (snd pos)
      method move decal = pos <- ((fst pos) + (fst decal),(snd pos) + (snd decal))
    end;;
    

class rectangle w h posc =
    object
      inherit shape
      val col = green
      val mutable pos = posc
      method is_pixel_in pix = (fst pix) <= (w+(fst pos)) &&
				(fst pix) >= (fst pos) &&
				(snd pix) <= (h+(snd pos)) &&
				(snd pix) >= (snd pos)
      method move decal = ()
    end;;


let sun = new circle 60 (0,140);;
let sun2 = new circle 60 (0,300);;
let list2 = [ new carre 400 (0,0) ; new rectangle 400 120 (0,0) ; sun ; sun2];;
  

let dessine x y elem =
  if elem#is_pixel_in (x,y)
  then
    begin
      set_color (elem#get_color ()) ;
      plot x y
    end

let affiche list =
  for x = 0 to 400 do
    for y = 0 to 400 do
      List.iter (fun elem -> dessine x y elem) list
    done;
  done;;


(* EN UTILISANT UNE CLASSE PARAMETREE *)
class ['a] with_timeline shape_init =
object
  val mutable shape  = (shape_init:'a)
  method on_time (i:int) = shape#move (5,0) ; shape
end


let circle_time = new with_timeline sun2;;

let sun_timeline () = open_graph " 400x400";
		      for i = 0 to 60 do
			begin
			  ignore (circle_time#on_time(i));
			  affiche list2
			end
		      done;
		      ();;
		      (* ignore (read_line ());; *)
  
(* METHODE PLUS FACILE MAIS DIFFÉRENTE *)
let my_move liste elem count x y =
  for i = 0 to count do
    begin
      elem#move (x,y);
      affiche liste;
    end
  done;;

let sun_normal () = open_graph " 400x400";
		 my_move list2 sun 20 5 2;
		 my_move list2 sun 10 5 1;
		 my_move list2 sun 5 3 0;
		 my_move list2 sun 10 5 (-1);
		 my_move list2 sun 20 5 (-2);
		 ();;
		 (* ignore (read_line ());; *)

let _ = sun_timeline ();
	sun_normal ();
	read_line ()
