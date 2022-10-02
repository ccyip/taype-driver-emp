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

  let obliv_int_add = foreign "obliv_int_add"
      (obliv_int @-> obliv_int @-> returning obliv_int)
end
