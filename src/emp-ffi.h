#ifndef TAYPE_DRIVER_EMP_FFI_H__
#define TAYPE_DRIVER_EMP_FFI_H__

#include <stdbool.h>

#ifdef __cplusplus
extern "C" {
#endif

void setup_driver(const char *addr, int port, int party, bool quiet);

void finalize_driver(void);

#define DRIVER_INT_SIZE (32)

typedef void *obliv_int;

obliv_int obliv_int_new(int n, int party);

void obliv_int_destroy(obliv_int n);

int obliv_int_reveal(obliv_int m);

obliv_int obliv_int_add(obliv_int m, obliv_int n);

#ifdef __cplusplus
}
#endif

#endif
