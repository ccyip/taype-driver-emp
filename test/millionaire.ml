open Driver

let run party n =
  setup_driver "127.0.0.1" 12345 party;
  let a =
    if party == party_alice
    then obliv_array_concat (private_s_int n) (private_s_int 0)
    (* else obliv_array_new_from 2 party_alice in *)
    else obliv_array_concat (s_int_from n party_alice) (s_int_from 0 party_alice) in
  let b =
    if party == party_bob
    then obliv_array_concat (private_s_int n) (private_s_int 0)
    (* else obliv_array_new_from 2 party_bob in *)
    else obliv_array_concat (s_int_from n party_bob) (s_int_from 0 party_bob) in
  let c = obliv_int_le a b in
  if unsafe_r_bool c
  then print_endline "bob"
  else print_endline "alice";
  let d = obliv_array_mux 1 c b a in
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
