#include "emp-ffi.h"
#include "emp-tool/circuits/integer.h"
#include <emp-sh2pc/emp-sh2pc.h>
#include <stdio.h>
#include <stdlib.h>
#include <sys/_types/_int64_t.h>

using namespace emp;

void setup_driver(const char *addr, int port, int party, bool quiet) {
  NetIO *io = new NetIO(party == ALICE ? nullptr : addr, port, quiet);
  setup_semi_honest(io, party);
}

void finalize_driver() { finalize_semi_honest(); }

obliv_int obliv_int_new(int n, int party) {
  return new Integer(DRIVER_INT_SIZE, n, party);
}

void obliv_int_destroy(obliv_int n) {
  if (nullptr == n) {
    return;
  }

  delete static_cast<Integer *>(n);
}

int obliv_int_reveal(obliv_int m) {
  auto m_ = static_cast<Integer *> (m);
  return m_->reveal<int>();
}

obliv_int obliv_int_add(obliv_int m, obliv_int n) {
  auto m_ = static_cast<Integer *>(m);
  auto n_ = static_cast<Integer *>(n);
  return new Integer((*m_) + (*n_));
}
