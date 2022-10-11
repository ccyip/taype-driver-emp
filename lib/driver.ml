module F = C.Functions
open C.Types

let party_public : int = 0

let party_alice : int = 1

let party_bob : int = 2

let my_party : int ref = ref party_public

let setup_driver addr port party =
  if party <> party_alice && party <> party_bob
  then raise (Failure "Unknown party: this driver only supports \
                       two-party-computation (1 and 2)");
  my_party := party;
  let addr = if party = party_alice then None else Some addr in
  F.setup_driver addr port party true

let finalize_driver = F.finalize_driver

let stamp : float ref = ref 0.0

let collect_stat _ = stamp := Unix.gettimeofday ()

let report_stat _ =
  let now = Unix.gettimeofday () in
  (* Convert to microseconds. *)
  (now -. !stamp) *. 1000000.0 |> Int.of_float

module OInt = struct

  let finalise p =
    Gc.finalise F.obliv_int_destroy p; p

  let to_int = F.obliv_int_reveal

  let to_bool = F.obliv_bool_reveal

  let make n party = finalise (F.obliv_int_new n party)

  let add m n = finalise (F.obliv_int_add m n)

  let sub m n = finalise (F.obliv_int_sub m n)

  let mul m n = finalise (F.obliv_int_mul m n)

  let div m n = finalise (F.obliv_int_div m n)

  let eq m n = finalise (F.obliv_int_eq m n)

  let le m n = finalise (F.obliv_int_le m n)

  let bnot m = finalise (F.obliv_bool_not m)

  let band m n = finalise (F.obliv_bool_and m n)

  let bor m n = finalise (F.obliv_bool_or m n)

  let mux s m n = finalise (F.obliv_int_mux s m n)

end

type obliv_array = obliv_int array

let obliv_array_new_from n party =
  Array.init n (fun _ -> OInt.make 0 party)

let private_obliv_array_new n = obliv_array_new_from n !my_party

let obliv_array_new n = Array.make n (OInt.make 0 party_public)

let obliv_array_concat a1 a2 = Array.append a1 a2

let obliv_array_slice a pos len = Array.sub a pos len

let obliv_array_mux len a0 a1 a2 =
  let b = a0.(0) in
  Array.init len (fun i -> OInt.mux b a1.(i) a2.(i))

let obliv_int_add m n = Array.make 1 (OInt.add m.(0) n.(0))

let obliv_int_sub m n = Array.make 1 (OInt.sub m.(0) n.(0))

let obliv_int_mul m n = Array.make 1 (OInt.mul m.(0) n.(0))

let obliv_int_div m n = Array.make 1 (OInt.div m.(0) n.(0))

let obliv_int_le m n = Array.make 1 (OInt.le m.(0) n.(0))

let obliv_int_eq m n = Array.make 1 (OInt.eq m.(0) n.(0))

let obliv_bool_not m = Array.make 1 (OInt.bnot m.(0))

let obliv_bool_and m n = Array.make 1 (OInt.band m.(0) n.(0))

let obliv_bool_or m n = Array.make 1 (OInt.bor m.(0) n.(0))

let s_int_from n party = Array.make 1 (OInt.make n party)

let private_s_int n = s_int_from n !my_party

let s_int n = s_int_from n party_public

let unsafe_r_int a = OInt.to_int a.(0)

let unsafe_r_bool a = OInt.to_bool a.(0)

let unsafe_if a t e = if unsafe_r_bool a then t else e
