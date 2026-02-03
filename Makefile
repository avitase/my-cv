PANDOC ?= pandoc

SRC ?= cv_nis_meinert.md
OUT ?= $(basename $(SRC))

BUILD_DIR := build

MD  := $(BUILD_DIR)/$(OUT).md
PDF  := $(BUILD_DIR)/$(OUT).pdf
DOCX := $(BUILD_DIR)/$(OUT).docx
HTML := $(BUILD_DIR)/$(OUT).html
TXT  := $(BUILD_DIR)/$(OUT).txt

.PHONY: all clean md pdf docx html txt

all: pdf md docx html txt

md: $(MD)
pdf: $(PDF)
docx: $(DOCX)
html: $(HTML)
txt: $(TXT)

$(BUILD_DIR):
	mkdir -p "$(BUILD_DIR)"

$(MD): $(SRC) | $(BUILD_DIR)
	cp $(SRC) $(MD)

$(PDF): $(SRC) | $(BUILD_DIR)
	$(PANDOC) "$(SRC)" -o "$(PDF)"

$(DOCX): $(SRC) | $(BUILD_DIR)
	$(PANDOC) "$(SRC)" -o "$(DOCX)"

$(HTML): $(SRC) | $(BUILD_DIR)
	$(PANDOC) "$(SRC)" -o "$(HTML)"

$(TXT): $(SRC) | $(BUILD_DIR)
	$(PANDOC) "$(SRC)" -t plain -o "$(TXT)"

clean:
	rm -f "$(MD)" "$(PDF)" "$(DOCX)" "$(HTML)" "$(TXT)"
