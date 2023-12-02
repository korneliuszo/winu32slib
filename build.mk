
LIBDIR=$(dir $(realpath $(lastword $(MAKEFILE_LIST))))

all: $(TARGET)

OBJS = $(patsubst %.cpp, build/%.obj, $(SRCS))
OBJSD = $(patsubst %.cpp, %.obj, $(SRCS))
RCC = $(patsubst %.rc, build/%.res, $(RESOURCE))
RCCD = $(patsubst %.rc, %.res, $(RESOURCE))

build/%.res:  %.rc
	mkdir -p build
	WINEDEBUG=-all WINEPREFIX="$(LIBDIR)/_wineprefix" WINEPATH=C:\\BCC55\\Bin \
	wine brcc32.exe -32 -fo$@ -IC:\\WX\\include -IC:\\BCC55\\include  $<

build/%.obj: %.cpp
	mkdir -p build
	WINEDEBUG=-all WINEPREFIX="$(LIBDIR)/_wineprefix" WINEPATH=C:\\BCC55\\Bin \
	wine bcc32.exe -q -D__WXMSW__ -q -c -P -tWM -a8 -DNDEBUG -w -O2    -IC:\\WX\\include -IC:\\BCC55\\include  -o$@ -c $<

$(TARGET): $(OBJS) $(RCC)
	mkdir -p build
	cd build ; \
	WINEDEBUG=-all WINEPREFIX="$(LIBDIR)/_wineprefix" WINEPATH=C:\\BCC55\\Bin \
	wine ilink32.exe -q -aa  -Tpe -aa  -LC:\\WX\\lib -LC:\\BCC55\\lib -LC:\\BCC55\\lib\\psdk c0w32 $(OBJSD),$@,,import32.lib cw32mt.lib ole2w32.lib wxmsw28.lib wxpng.lib wxjpeg.lib wxtiff.lib wxzlib.lib wxregex.lib wxexpat.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib comctl32.lib wsock32.lib,, $(RCCD)
	cp build/$@ $@
