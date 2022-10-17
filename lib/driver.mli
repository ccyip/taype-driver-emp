type obliv_array

val party_public : int

val party_alice : int

val party_bob : int

val setup_driver : ?verbose:bool -> string -> int -> int -> unit

val finalize_driver : unit -> unit

val collect_stat : unit -> unit

val report_stat : unit -> int

val obliv_array_new_from : int -> int -> obliv_array

val private_obliv_array_new : int -> obliv_array

val obliv_array_new : int -> obliv_array

val obliv_array_concat : obliv_array -> obliv_array -> obliv_array

val obliv_array_slice : obliv_array -> int -> int -> obliv_array

val obliv_array_mux : int -> obliv_array -> obliv_array -> obliv_array -> obliv_array

val obliv_int_add : obliv_array -> obliv_array -> obliv_array

val obliv_int_sub : obliv_array -> obliv_array -> obliv_array

val obliv_int_mul : obliv_array -> obliv_array -> obliv_array

val obliv_int_div : obliv_array -> obliv_array -> obliv_array

val obliv_int_le : obliv_array -> obliv_array -> obliv_array

val obliv_int_eq : obliv_array -> obliv_array -> obliv_array

val obliv_bool_not : obliv_array -> obliv_array

val obliv_bool_and : obliv_array -> obliv_array -> obliv_array

val obliv_bool_or : obliv_array -> obliv_array -> obliv_array

val s_int_from : int -> int -> obliv_array

val private_s_int : int -> obliv_array

val s_int : int -> obliv_array

val unsafe_r_int : obliv_array -> int

val unsafe_r_bool : obliv_array -> bool

val unsafe_if : obliv_array -> 'a -> 'a -> 'a
