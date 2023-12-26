(lang dune 3.7)
(using ctypes 0.3)

(generate_opam_files true)

(name taype-driver-emp-legacy)
(license "MIT")
(maintainers "Qianchuan Ye <yeqianchuan@gmail.com>")
(authors "Qianchuan Ye")
(source (github ccyip/taype-driver-emp))

(package
 (name taype-driver-emp-legacy)
 (depends (ctypes (>= 0.20)))
 (synopsis "Emp-toolkit driver (legacy) for the Taype language")
)
