CFLAGS=-Wall -O2
CPPFLAGS=-include src/liboutils/outils.h -isystem src/liboutils/include -Isrc/bin/md5 -D_GNU_SOURCE -D_DEFAULT_SOURCE
LDFLAGS=-Wl,--as-needed -lcrypto

%: %.o
	$(CC) -o $@ $^ $(LDFLAGS)

ALL=src/usr.bin/apply/apply src/usr.bin/jot/jot src/usr.bin/lam/lam src/usr.bin/lndir/lndir src/bin/md5/md5 src/usr.bin/rs/rs src/usr.bin/gzsig/gzsig src/usr.bin/signify/signify src/usr.bin/calendar/calendar src/usr.bin/vis/vis src/usr.bin/unvis/unvis
all: $(ALL)

src/usr.bin/apply/apply: src/usr.bin/apply/apply.o src/liboutils/strlcpy.o

src/usr.bin/jot/jot: src/usr.bin/jot/jot.o src/liboutils/strlcpy.o src/liboutils/strlcat.o src/liboutils/strtonum.o src/liboutils/arc4random.o src/liboutils/getentropy_linux.o src/liboutils/explicit_bzero.o src/liboutils/sha512.o src/liboutils/mem_clr.o

src/usr.bin/lam/lam: src/usr.bin/lam/lam.o src/liboutils/strlcpy.o

src/usr.bin/lndir/lndir: src/usr.bin/lndir/lndir.o src/liboutils/strlcpy.o src/liboutils/strlcat.o src/liboutils/errc.o src/liboutils/verrc.o

src/bin/md5/md5: src/bin/md5/md5.o src/bin/md5/crc.o src/liboutils/sha512.o src/liboutils/mem_clr.o src/liboutils/explicit_bzero.o src/liboutils/md5.o src/liboutils/rmd160.o src/liboutils/sha1.o src/liboutils/sha2.o src/liboutils/fgetln.o src/liboutils/base64.o src/liboutils/md5hl.o src/liboutils/rmd160hl.o src/liboutils/sha1hl.o src/liboutils/sha224hl.o src/liboutils/sha256hl.o src/liboutils/sha384hl.o src/liboutils/sha512hl.o

src/usr.bin/rs/rs: src/usr.bin/rs/rs.o src/liboutils/strtonum.o src/liboutils/reallocarray.c

src/usr.bin/signify/signify: src/usr.bin/signify/signify.o src/usr.bin/signify/crypto_api.o src/usr.bin/signify/fe25519.o src/usr.bin/signify/mod_ed25519.o src/usr.bin/signify/mod_ge25519.o src/usr.bin/signify/sc25519.o src/usr.bin/signify/smult_curve25519_ref.o src/liboutils/strlcpy.o src/liboutils/base64.o src/liboutils/explicit_bzero.o src/liboutils/ohash.o src/liboutils/arc4random.o src/liboutils/getentropy_linux.o src/liboutils/readpassphrase.o src/liboutils/sha2.o src/liboutils/sha256hl.o src/liboutils/sha512hl.o src/liboutils/timingsafe_bcmp.o src/liboutils/bcrypt_pbkdf.o src/liboutils/blowfish.o

src/usr.bin/calendar/calendar: src/usr.bin/calendar/calendar.o src/usr.bin/calendar/day.o src/usr.bin/calendar/io.o src/usr.bin/calendar/ostern.o src/usr.bin/calendar/paskha.o src/usr.bin/calendar/pesach.o src/liboutils/arc4random_uniform.o src/liboutils/arc4random.o src/liboutils/getentropy_linux.o src/liboutils/explicit_bzero.o src/liboutils/sha2.o

src/usr.bin/gzsig/gzsig: src/usr.bin/gzsig/gzsig.o src/usr.bin/gzsig/key.o src/usr.bin/gzsig/sign.o src/usr.bin/gzsig/ssh.o src/usr.bin/gzsig/ssh2.o src/usr.bin/gzsig/util.o src/usr.bin/gzsig/verify.o src/usr.bin/gzsig/x509.o src/liboutils/strlcpy.o src/liboutils/base64.o src/liboutils/sha1.o

src/usr.bin/vis/vis: src/usr.bin/vis/vis.o src/usr.bin/vis/foldit.o src/liboutils/vis.o

src/usr.bin/unvis/unvis: src/usr.bin/unvis/unvis.o src/liboutils/unvis.o

clean:
	rm -f src/*/*/*.o

DESTDIR=
PREFIX=/usr

install: all
	mkdir -p $(DESTDIR)$(PREFIX)/bin $(DESTDIR)$(PREFIX)/share/man/man1
	install -m755 $(ALL) $(DESTDIR)$(PREFIX)/bin
	ln -sf md5 $(DESTDIR)$(PREFIX)/bin/sha1
	ln -sf md5 $(DESTDIR)$(PREFIX)/bin/sha256
	ln -sf md5 $(DESTDIR)$(PREFIX)/bin/sha512
	ln -sf md5 $(DESTDIR)$(PREFIX)/bin/cksum
	install -m644 src/*/*/*.1 $(DESTDIR)$(PREFIX)/share/man/man1
	ln -sf md5.1 $(DESTDIR)$(PREFIX)/share/man/man1/sha1.1
	ln -sf md5.1 $(DESTDIR)$(PREFIX)/share/man/man1/sha256.1
	ln -sf md5.1 $(DESTDIR)$(PREFIX)/share/man/man1/sha512.1

install-calendars:
	cp -r src/usr.bin/calendar/calendars $(DESTDIR)$(PREFIX)/share/calendar
