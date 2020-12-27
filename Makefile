BASENAME = Razvan_Deaconescu_CV
BASENAME_EN = $(BASENAME)_en
PDF = $(addsuffix .pdf, $(BASENAME))
TEX = $(addsuffix .tex, $(BASENAME))
PDF_EN = $(addsuffix .pdf, $(BASENAME_EN))
TEX_EN = $(addsuffix .tex, $(BASENAME_EN))
PDFLATEX = pdflatex
BIBTEX = bibtex
OUT_DIR = texfiles

.PHONY: clean all

all: $(PDF) $(PDF_EN)

$(PDF): $(TEX)
	# Create out directory.
	-test -d $(OUT_DIR) || mkdir $(OUT_DIR)
	# Run twice, so TOC is also updated.
	$(PDFLATEX) -output-directory $(OUT_DIR) -jobname $(basename $@) $<
	#$(BIBTEX) $(OUT_DIR)/$(basename $@)
	$(PDFLATEX) -output-directory $(OUT_DIR) -jobname $(basename $@) $<
	ln -f $(OUT_DIR)/$@ .

$(PDF_EN): $(TEX_EN)
	# Create out directory.
	-test -d $(OUT_DIR) || mkdir $(OUT_DIR)
	# Run twice, so TOC is also updated.
	$(PDFLATEX) -output-directory $(OUT_DIR) -jobname $(basename $@) $<
	#$(BIBTEX) $(OUT_DIR)/$(basename $@)
	$(PDFLATEX) -output-directory $(OUT_DIR) -jobname $(basename $@) $<
	ln -f $(OUT_DIR)/$@ .

clean:
	-test -d $(OUT_DIR) && rm -fr $(OUT_DIR)
	-rm -f $(PDF) $(PDF_EN)
