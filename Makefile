
INPUT_FILES := main.Rmd refs.bib _output.yml

PDF_FORMAT := bookdown::pdf_document2
DOCX_FORMAT := bookdown::word_document2

OUTPUT_DIR := output
PDF_FILE := $(OUTPUT_DIR)/fact-check.pdf
DOCX_FILE := $(PDF_FILE:.pdf=.docx)
# ---- targets

all: $(PDF_FILE)

docx: $(DOCX_FILE)

$(OUTPUT_DIR):
	mkdir -p $@

$(PDF_FILE): $(INPUT_FILES) $(OUTPUT_DIR)
	Rscript -e 'rmarkdown::render("$<", "$(PDF_FORMAT)", "$@")'

$(DOCX_FILE): $(INPUT_FILES)
	Rscript -e 'rmarkdown::render("$<", "$(DOCX_FORMAT)", "$@")'

view:
	open -a Skim $(PDF_FILE)
