(lang dune 3.4)
(using ctypes 0.1)

(generate_opam_files true)

(name taype-driver-emp)
(license "MIT")
(maintainers "Qianchuan Ye <yeqianchuan@gmail.com>")
(authors "Qianchuan Ye")
(source (github ccyip/taype-driver-emp))

(package
 (name taype-driver-emp)
 (depends (ctypes (>= 0.20)))
 (synopsis "Emp-toolkit driver for the Taype language")
)
