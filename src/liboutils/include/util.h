#include <stdint.h>
#include <sys/types.h>

size_t	strlcpy(char *, const char *, size_t);
void	explicit_bzero(void *, size_t);
int	timingsafe_bcmp(const void *, const void *, size_t);
void	arc4random_buf(void *, size_t);
int	bcrypt_pbkdf(const char *, size_t, const uint8_t *, size_t, uint8_t *, size_t, unsigned int);
int	RAND_bytes(unsigned char *, int);
int	b64_ntop(u_char const *, size_t, char *, size_t);
int	b64_pton(char const *, u_char *target, size_t);
void *	reallocarray(void *, size_t, size_t);
void *	recallocarray(void *, size_t, size_t, size_t);

