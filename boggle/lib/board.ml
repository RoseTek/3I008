type t = char array array

let get_letter board i j =
  board.(i).(j)

let dim board =
  Array.length board.(0)

let all_positions board =
  failwith "Unimplemented"

let are_neighbours board (i, j) (i', j') =
  failwith "Unimplemented"

let is_valid_pos board (i, j) =
  failwith "Unimplemented"

let neighbours board (i, j) =
  failwith "Unimplemented"

let make dim make_char =
  failwith "Unimplemented"

let from_string s =
  failwith "Unimplemented"

let print board =
  failwith "Unimplemented"
