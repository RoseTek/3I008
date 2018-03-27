
(* #load "graphics.cma";; *)
open Graphics;;
      
class virtual shape =
    object (self)
      method virtual is_pixel_in : (int * int) -> bool
      val virtual col : color
      val virtual pos : (int * int)
      method get_color () = col
end;;

	  
class carre c posc =
    object
      inherit shape
      val col = blue
      val pos = posc
      method is_pixel_in pix = (fst pix) <= (c+(fst pos)) &&
				(fst pix) >= (fst pos) &&
				(snd pix) <= (c+(snd pos)) &&
				(snd pix) >= (snd pos)
end;;


class rectangle w h posc =
    object
      inherit shape
      val col = green
      val pos = posc
      method is_pixel_in pix = (fst pix) <= (w+(fst pos)) &&
				(fst pix) >= (fst pos) &&
				(snd pix) <= (h+(snd pos)) &&
				(snd pix) >= (snd pos)
end;;

let c = new carre 88 (240,125);;
let r = new rectangle 120 250 (400,230)

let list = [ c ; r ];;

open_graph " 650x750";;

let kill_me elem =
  set_color (elem#get_color ());
  for x = 0 to 650 do
    for y = 0 to 750 do
      if elem#is_pixel_in (x,y) then
	plot x y
    done;
  done in
    List.iter kill_me list;;

read_line ();;
