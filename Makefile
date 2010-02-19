ifndef SNDFILE_INCLUDE_DIR
SNDFILE_INCLUDE_DIR=/usr/include
endif

SNDFILE_INCLUDE=$(SNDFILE_INCLUDE_DIR)/sndfile.h
SNDFILE_SWIG_INCLUDE=src/sndfile.i

CC = /usr/bin/swig
CFLAGS = -cffi -DCOMMON -Wall
ECHO = echo
Q = @

all: cl-sndfile-swig.lisp

cl-sndfile-swig.lisp: $(SNDFILE_SWIG_INCLUDE) $(SNDFILE_INCLUDE)
	$(Q)$(ECHO) "Generating cffi with swig"
	$(Q)$(ECHO) "Include file: $(SNDFILE_INCLUDE)"
	$(CC) $(CFLAGS) -I$(SNDFILE_INCLUDE) $(SNDFILE_SWIG_INCLUDE)
	sed 's|#x7FFFFFFFFFFFFFFFLL|#x7FFFFFFFFFFFFFFF|' src/cl-sndfile-swig.lisp > src/cl-sndfile-swig.lisp.tmp; \
	mv src/cl-sndfile-swig.lisp.tmp src/cl-sndfile-swig.lisp

$(SNDFILE_SWIG_INCLUDE):
	$(Q)$(ECHO) "Creating include file for swig"
	sed 's|__SNDFILE_INCLUDE__|$(SNDFILE_INCLUDE)|' $(SNDFILE_SWIG_INCLUDE).tmpl > $(SNDFILE_SWIG_INCLUDE)

clean:
	$(Q)$(ECHO) "Doing clean"
	rm -f $(SNDFILE_SWIG_INCLUDE) src/cl-sndfile-swig.lisp src/cl-sndfile-swig.lisp.tmp
