#define DEF_WEAK(x)
#define __weak_alias(new, old) \
	extern __typeof(old) new __attribute__((weak, alias(#old)))
#define MAKE_CLONE(new, old) \
	extern __typeof(old) new __attribute__((weak, alias(#old)))
#define __dead __attribute__((__noreturn__))
#define __BEGIN_DECLS
#define __END_DECLS

#define b64_ntop __b64_ntop
#define b64_pton __b64_pton

#define NOFILE_MAX NOFILE

#define letoh16 le16toh

#ifndef SA_LEN
#define SA_LEN(X) \
	(((struct sockaddr*)(X))->sa_family == AF_INET ? sizeof(struct sockaddr_in) : \
	 ((struct sockaddr*)(X))->sa_family == AF_INET6 ? sizeof(struct sockaddr_in6) : sizeof(struct sockaddr))
#endif

#ifndef timespecadd
#define timespecadd(tsp, usp, vsp)					\
	do {								\
		(vsp)->tv_sec = (tsp)->tv_sec + (usp)->tv_sec;		\
		(vsp)->tv_nsec = (tsp)->tv_nsec + (usp)->tv_nsec;	\
		if ((vsp)->tv_nsec >= 1000000000L) {			\
			(vsp)->tv_sec++;				\
			(vsp)->tv_nsec -= 1000000000L;			\
		}							\
	} while (0)
#endif
#ifndef timespecsub
#define timespecsub(tsp, usp, vsp)					\
	do {								\
		(vsp)->tv_sec = (tsp)->tv_sec - (usp)->tv_sec;		\
		(vsp)->tv_nsec = (tsp)->tv_nsec - (usp)->tv_nsec;	\
		if ((vsp)->tv_nsec < 0) {				\
			(vsp)->tv_sec--;				\
			(vsp)->tv_nsec += 1000000000L;			\
		}							\
	} while (0)
#endif


#include <stdio.h>
#include <stdint.h>
#include <sys/types.h>

char *fgetln(FILE *, size_t *);
size_t strlcpy(char *, const char *, size_t);
size_t strlcat(char *, const char *, size_t);
long long strtonum(const char *, long long, long long, const char **);
__dead void errc(int, int, const char *, ...);
uint32_t arc4random(void);
uint32_t arc4random_uniform(uint32_t);
void arc4random_buf(void *, size_t);
int timingsafe_bcmp(const void *, const void *, size_t);
void *reallocarray(void *, size_t, size_t);
void *recallocarray(void *, size_t, size_t, size_t);
int pledge(const char *, const char **);
void explicit_bzero(void *buf, size_t len);
int getentropy(void *buf, size_t len);
void freezero(void *ptr, size_t size);
int b64_ntop(u_char const *, size_t, char *, size_t);
