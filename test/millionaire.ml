open Driver

let run party n =
  setup_driver "127.0.0.1" 12345 party;
  let a =
    if party == party_alice
    then private_s_int n
    else obliv_array_new_from 1 party_alice in
  let b =
    if party == party_bob
    then private_s_int n
    else obliv_array_new_from 1 party_bob in
  let c = obliv_int_le a b in
  if unsafe_r_bool c
  then print_endline "bob"
  else print_endline "alice";
  let d = obliv_array_mux c b a in
  print_int (unsafe_r_int d);
  print_newline ();
  finalize_driver ()

let _ =
  if Array.length Sys.argv <> 3
  then exit 1
  else
    let party = int_of_string Sys.argv.(1) in
    let n = int_of_string Sys.argv.(2) in
    run party n;
    Gc.compact ()
