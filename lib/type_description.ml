open Ctypes

module Types (F : Ctypes.TYPE) = struct
  open F

  type obliv_int = int ptr

  let driver_int_size = constant "DRIVER_INT_SIZE" int

  let obliv_int = ptr void
end
