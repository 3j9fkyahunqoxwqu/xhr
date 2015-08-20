# http://wiki.whatwg.org/wiki/GitHub#Makefile

ANOLIS = anolis

all: Overview.html ../xref/xrefs/dom/xhr.json

Overview.html: Overview.src.html ../xref Makefile
	$(ANOLIS) --omit-optional-tags --quote-attr-values --xref="../xref" \
	--enable=xspecxref --enable=refs $< $@

../xref/xrefs/dom/xhr.json: Overview.src.html Makefile
	$(ANOLIS) --dump-xrefs=$@ $< /tmp/spec
