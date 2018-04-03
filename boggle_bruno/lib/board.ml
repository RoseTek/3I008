type t = char array array

let get_letter board i j =
  board.(i).(j)

let dim board =
  Array.length board.(0)

let all_positions board =
  Iter.product (Iter.range 0 ((dim board)-1))  (Iter.range 0 ((dim board)-1))

let are_neighbours board (i, j) (i', j') =
  if (i = i' && j = j') then
    false
  else
    if (i = i' || i = (i'-1) || i = (i'+1)) &&
	 (j = j' || j = (j'-1) || j = (j'+1)) then
      true
    else
      false

let is_valid_pos board (i, j) =
  if i < 0 || j < 0 || i >= (dim board) || j >= (dim board) then false
  else true

let neighbours board (i, j) =
  let iterator_final = ref Iter.empty in
  let iterator_all = all_positions board in
  let test_voisin elem =
    if are_neighbours board (i,j) elem then
      begin
  	print_int (fst elem);
  	print_string " ";
  	print_int (snd elem);
  	print_string " est voisin \n";
  	iterator_final := Iter.append !iterator_final (Iter.singleton elem)
      end
  in
  let rec trouve_voisin it =
    match it with
    | [] -> ()
    | [e] -> test_voisin e
    | h::t -> test_voisin h ; trouve_voisin t
  in
  trouve_voisin (Iter.to_rev_list iterator_all);
  !iterator_final

let make dim make_char =
  let matrix = ref (Array.make_matrix dim dim 'e') in
  for x = 0 to (dim - 1)  do
    begin
      for y = 0 to (dim-1) do
	(!matrix).(x).(y) <- (make_char ())
      done;
    end
  done;
  !matrix
   		    
let from_string s =
  let size = String.length s in
  let n = int_of_float (sqrt (float_of_int size)) in
  if (n * n) != size then None
  else
    begin
      let matrix = ref (Array.make_matrix n n 'e') in
      for x = 0 to (n - 1)  do
	begin
	  for y = 0 to (n-1) do
	    (!matrix).(x).(y) <- (String.get s ((x*n) +y))
	  done;
	end
      done;
       Some (!matrix)
    end

let print board =
  print_string "{[";
  for x = 0 to ((dim board) - 1)  do
    begin
      for y = 0 to ((dim board) -1) do
	begin
	  print_char (get_letter board x y);
	  if (y != ((dim board) - 1)) then
	    print_char ' '
	end
      done;
      if (x != ((dim board) - 1)) then
	print_char '\n'
    end
  done;
  print_string "]}\n"
