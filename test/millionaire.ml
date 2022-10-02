open Driver

let run party n =
  let addr = if party == 1 then None else Some "127.0.0.1" in
  setup_driver addr 12345 party;
  let a = obliv_int_new n 1 in
  let b = obliv_int_new n 2 in
  let c = obliv_int_add a b in
  print_int (obliv_int_reveal c);
  print_newline ();
  finalize_driver ()

let _ =
  if Array.length Sys.argv <> 3
  then exit 1
  else
    let party = int_of_string Sys.argv.(1) in
    let n = int_of_string Sys.argv.(2) in
    if party <> 1 && party <> 2 then exit 1;
    run party n
