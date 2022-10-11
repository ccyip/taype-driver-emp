open Ctypes

module Types = Types_generated

module Functions (F : Ctypes.FOREIGN) = struct
  open F
  open Types

  let setup_driver = foreign "setup_driver"
      (string_opt @-> int @-> int @-> bool @-> returning void)

  let finalize_driver = foreign "finalize_driver"
      (void @-> returning void)

  let obliv_int_new = foreign "obliv_int_new"
      (int @-> int @-> returning obliv_int)

  let obliv_int_destroy = foreign "obliv_int_destroy"
      (obliv_int @-> returning void)

  let obliv_int_reveal = foreign "obliv_int_reveal"
      (obliv_int @-> returning int)

  let obliv_bool_reveal = foreign "obliv_bool_reveal"
      (obliv_int @-> returning bool)

  let obliv_int_add = foreign "obliv_int_add"
      (obliv_int @-> obliv_int @-> returning obliv_int)

  let obliv_int_sub = foreign "obliv_int_sub"
      (obliv_int @-> obliv_int @-> returning obliv_int)

  let obliv_int_mul = foreign "obliv_int_mul"
      (obliv_int @-> obliv_int @-> returning obliv_int)

  let obliv_int_div = foreign "obliv_int_div"
      (obliv_int @-> obliv_int @-> returning obliv_int)

  let obliv_int_eq = foreign "obliv_int_eq"
      (obliv_int @-> obliv_int @-> returning obliv_int)

  let obliv_int_le = foreign "obliv_int_le"
      (obliv_int @-> obliv_int @-> returning obliv_int)

  let obliv_bool_not = foreign "obliv_bool_not"
      (obliv_int @-> returning obliv_int)

  let obliv_bool_and = foreign "obliv_bool_and"
      (obliv_int @-> obliv_int @-> returning obliv_int)

  let obliv_bool_or = foreign "obliv_bool_or"
      (obliv_int @-> obliv_int @-> returning obliv_int)

  let obliv_int_mux = foreign "obliv_int_mux"
      (obliv_int @-> obliv_int @-> obliv_int @-> returning obliv_int)

end
