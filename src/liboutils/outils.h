#define __weak_alias(new, old) \
        extern __typeof(old) new __attribute__((weak, alias(#old)))
#define __dead __attribute__((__noreturn__))

#define NOFILE_MAX NOFILE

#define letoh16 le16toh

#include <stdio.h>
#include <stdint.h>

char *fgetln(FILE *, size_t *);
size_t strlcpy(char *, const char *, size_t);
size_t strlcat(char *, const char *, size_t);
long long strtonum(const char *, long long, long long, const char **);
__dead void errc(int, int, const char *, ...);
uint32_t arc4random(void);
uint32_t arc4random_uniform(uint32_t);
void arc4random_buf(void *, size_t);
int timingsafe_bcmp(const void *, const void *, size_t);

