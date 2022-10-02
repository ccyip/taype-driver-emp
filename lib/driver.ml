module F = C.Functions

let finalise p =
  Gc.finalise F.obliv_int_destroy p; p

let setup_driver ?(quiet=true) addr port party =
  F.setup_driver addr port party quiet

let finalize_driver = F.finalize_driver

let obliv_int_reveal = F.obliv_int_reveal

let obliv_int_new n party = finalise (F.obliv_int_new n party)

let obliv_int_add m n = finalise (F.obliv_int_add m n)
