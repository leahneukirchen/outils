#include <time.h>
#include <sys/types.h>

#define SECSPERDAY 24*60*60
#define TM_YEAR_BASE 1900

#define isleap(y) (((y) % 4) == 0 && (((y) % 100) != 0 || ((y) % 400) == 0))
