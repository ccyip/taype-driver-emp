# taype-driver-emp

## Dependencies

To build this library, we need the OCaml toolchain, managed by
[opam](https://opam.ocaml.org), and the dependencies for [EMP
toolkit](https://github.com/emp-toolkit/emp-tool), notably OpenSSL.

After setting up opam and OCaml (currently best-tested on 4.14.1), install the
OCaml dependencies by:

``` sh
opam install dune ctypes
```

## Build and install

First, build and install EMP toolkit. You may have to explicitly provide OpenSSL
path. To avoid polluting our system, here we will install the libraries to
`$OPAM_SWITCH_PREFIX`, so we can simply remove the opam switch when we are done
with it. But you can also install them directly to a system prefix.

``` sh
# Create some build directories
mkdir -p extern/{emp-tool,emp-ot,emp-sh2pc}/build

# Build and install emp-tool
cd extern/emp-tool/build
# Specify the target prefix
cmake -DCMAKE_INSTALL_PREFIX=$OPAM_SWITCH_PREFIX ..
make install
cd ../../..

# Build and install emp-ot
cd extern/emp-ot/build
cmake -DCMAKE_INSTALL_PREFIX=$OPAM_SWITCH_PREFIX ..
make install
cd ../../..

# Build and install emp-sh2pc
cd extern/emp-sh2pc/build
cmake -DCMAKE_INSTALL_PREFIX=$OPAM_SWITCH_PREFIX ..
make install
cd ../../..
```

Then, build and install `emp-ffi`, which provides the suitable FFI bindings to
our OCaml library.

``` sh
mkdir -p src/build
cd src/build
cmake -DCMAKE_INSTALL_PREFIX=$OPAM_SWITCH_PREFIX ..
make install
cd ../..
```

Finally, build and install the driver. You will have to set the environment
variable of library path if the previous libraries were not installed to a
system prefix.

``` sh
# On Linux
export LD_LIBRARY_PATH "$OPAM_SWITH_PREFIX/lib"

# On Mac
export DYLD_LIBRARY_PATH "$OPAM_SWITH_PREFIX/lib"

dune build
dune install
```
