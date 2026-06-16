.PHONY: all data report clean

# One-command reproduction: download data, run analysis, render the HTML report.
all: report

data:
	bash scripts/download_data.sh

report: data
	quarto render

clean:
	rm -rf docs results data/filtered_gene_bc_matrices data/*.tar.gz .quarto
