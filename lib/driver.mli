type obliv_array

val party_public : int

val party_alice : int

val party_bob : int

val setup_driver : string -> int -> int -> unit

val finalize_driver : unit -> unit

val obliv_array_new_from : int -> int -> obliv_array

val private_obliv_array_new : int -> obliv_array

val obliv_array_new : int -> obliv_array

val obliv_array_concat : obliv_array -> obliv_array -> obliv_array

val obliv_array_slice : obliv_array -> int -> int -> obliv_array

val obliv_array_mux : int -> obliv_array -> obliv_array -> obliv_array -> obliv_array

val obliv_int_add : obliv_array -> obliv_array -> obliv_array

val obliv_int_sub : obliv_array -> obliv_array -> obliv_array

val obliv_int_le : obliv_array -> obliv_array -> obliv_array

val obliv_int_eq : obliv_array -> obliv_array -> obliv_array

val s_int_from : int -> int -> obliv_array

val private_s_int : int -> obliv_array

val s_int : int -> obliv_array

val unsafe_r_int : obliv_array -> int

val unsafe_r_bool : obliv_array -> bool

val unsafe_if : obliv_array -> 'a -> 'a -> 'a
