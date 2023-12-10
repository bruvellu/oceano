SHELL := /bin/bash
# Build html files with the same header, sidebar, and footer
#
# Individual pages should be placed in html/pages

# Output directory
OUTDIR=www

# Directories with additional files
HTML=html
PAGES=$(HTML)/pages/
CSS=css
JS=js
IMAGES=images

# HTML template parts
INDEX=$(HTML)/index.html
HEADER=$(HTML)/header.html
SIDEBAR=$(HTML)/sidebar.html
FOOTER=$(HTML)/footer.html

all: clean compile sync

clean:
	$(info Cleaning up $(OUTDIR))
	rm -r $(OUTDIR)
	mkdir $(OUTDIR)

compile:
	$(info Compiling HTML files...)
	for PAGE in $(PAGES)/*.html; do \
		NAME=`basename $$PAGE`; \
		cat $(HEADER) $$PAGE $(SIDEBAR) $(FOOTER) > $(OUTDIR)/$$NAME; \
	done
	# Workaround for main page
	cat $(HEADER) $(PAGES)/oceano.html $(SIDEBAR) $(PAGES)/galeria.html $(FOOTER) > $(OUTDIR)/oceano.html
	rm $(OUTDIR)/galeria.html


sync:
	$(info Syncing website files...)
	cp -vu $(INDEX) $(OUTDIR)/
	cp -vur $(CSS) $(OUTDIR)/
	cp -vur $(JS) $(OUTDIR)/
	cp -vur $(IMAGES) $(OUTDIR)/

