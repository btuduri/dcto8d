# Project: dcto8d

CFLAGS = -O2 $(shell sdl-config --cflags) $(shell pkg-config --cflags SDL_ttf)
LDFLAGS = $(shell sdl-config --libs) $(shell pkg-config --libs SDL_ttf)

objects = object/dcto8dmain.o object/dc6809emul.o \
	object/dcto8dinterface.o object/dcto8ddevices.o object/dcto8demulation.o \
	object/dcto8dkeyb.o object/dcto8doptions.o object/dcto8dvideo.o \
	object/dc6809dass.o object/dcto8ddesass.o

dcto8d : $(objects)
	cc $(objects) $(LDFLAGS) -o dcto8d

object/dcto8dmain.o : source/dcto8dmain.c object
	cc -c source/dcto8dmain.c -o object/dcto8dmain.o $(CFLAGS)

object/dc6809emul.o : source/dc6809emul.c object
	cc -c source/dc6809emul.c -o object/dc6809emul.o $(CFLAGS)

object/dcto8dinterface.o : source/dcto8dinterface.c object
	cc -c source/dcto8dinterface.c -o object/dcto8dinterface.o $(CFLAGS) 

object/dcto8ddevices.o : source/dcto8ddevices.c object
	cc -c source/dcto8ddevices.c -o object/dcto8ddevices.o $(CFLAGS)

object/dcto8demulation.o : source/dcto8demulation.c object
	cc -c source/dcto8demulation.c -o object/dcto8demulation.o $(CFLAGS)

object/dcto8dkeyb.o : source/dcto8dkeyb.c source/dcto8dkeyb.h object
	cc -c source/dcto8dkeyb.c -o object/dcto8dkeyb.o $(CFLAGS)

object/dcto8doptions.o : source/dcto8doptions.c object
	cc -c source/dcto8doptions.c -o object/dcto8doptions.o $(CFLAGS)

object/dcto8dvideo.o : source/dcto8dvideo.c object
	cc -c source/dcto8dvideo.c -o object/dcto8dvideo.o $(CFLAGS)

object/dc6809dass.o: source/dc6809dass.c source/dc6809dass.h object
	cc -c source/dc6809dass.c -o object/dc6809dass.o $(CFLAGS)

object/dcto8ddesass.o: source/dcto8ddesass.c object
	cc -c source/dcto8ddesass.c -o object/dcto8ddesass.o $(CFLAGS)

object :
	mkdir -p object
clean :
	rm -fr dcto8d object $(objects)
