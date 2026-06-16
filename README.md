# Single-cell RNA-seq: raw 10x counts → annotated cell types

[![Reproduce](https://github.com/pgristow/scrnaseq-pbmc-scanpy/actions/workflows/publish.yml/badge.svg)](https://github.com/pgristow/scrnaseq-pbmc-scanpy/actions/workflows/publish.yml)
[![Live report](https://img.shields.io/badge/live%20report-GitHub%20Pages-2e7d32)](https://pgristow.github.io/scrnaseq-pbmc-scanpy/)
[![Made with Quarto](https://img.shields.io/badge/made%20with-Quarto-447099)](https://quarto.org)

> **Roche Principal Scientist (NGS) & PhD — I turn sequencing data into clean, reproducible answers.**

A worked, end-to-end single-cell RNA-seq analysis: from a raw 10x Genomics count matrix to an
**annotated, interactive UMAP** of immune cell types — with the full code present but folded, so it
reads as a report for a client and as a pipeline for a reviewer.

### 👉 [**See the live report**](https://pgristow.github.io/scrnaseq-pbmc-scanpy/)

---

## The question
A 10x run returns ~2,700 cells × ~32,000 genes and **no labels**. *Which immune cell types are
present, in what proportions, and what genes define them?*

## The data
The canonical **10x Genomics 3k PBMC** dataset (healthy-donor peripheral blood) — the standard
reference for single-cell method validation. Public and freely redistributable. ~7 MB; the whole
pipeline re-runs in **a few minutes on a laptop**.

## Key decisions (and why)
- **Salmon-free, count-matrix start** — single-cell quantification is upstream; this repo owns the
  analysis from filtered counts, which is where judgment lives.
- **Leiden at resolution 1.0** — resolves seven PBMC lineages; the report explains why resolution
  is a question-driven choice (and honestly flags CD8 T as unresolved at this depth), not a default.
- **Data-driven annotation** — clusters are labelled by *best-matching canonical marker panel*
  rather than hand-typed cluster numbers, so the labelling is reproducible and defensible.

## The result
7 recognisable PBMC populations (CD4 T, classical & non-classical monocytes, B, NK, dendritic,
megakaryocyte), each validated by a marker dot-plot — with CD8 T honestly flagged as unresolved at
this depth. Outputs: an annotated `.h5ad`, marker tables, a composition table,
publication-quality figures, and an **interactive UMAP** you can hover and filter.

## What you get if you hire me for this
| Deliverable | Included |
|---|---|
| QC, clustering, UMAP, marker genes | ✅ |
| Cell-type annotation with marker evidence | ✅ |
| Publication-quality figures (UMAP, dot-plot, violins) | ✅ |
| Interactive explorer (hover/zoom) | ✅ |
| Processed `.h5ad` object | ✅ |
| Self-contained reproducible report (code folded) | ✅ |
| Plain-English interpretation **and caveats** | ✅ |

## Reproduce it
```bash
git clone https://github.com/pgristow/scrnaseq-pbmc-scanpy
cd scrnaseq-pbmc-scanpy
conda env create -f environment.yml && conda activate sc-pbmc
make all      # download data → run analysis → render report to docs/
```
Or with Docker: `docker build -t scpbmc . && docker run --rm -v "$PWD":/work scpbmc`.

## Note on scope
This is a **reproducible demonstration on public data**. Production engagements use a private,
hardened pipeline (automated QC tuning, doublet detection, multi-sample integration) run on **your**
data under NDA. The demo sells the *service*; the engine stays private.

## Licence & attribution
Code: MIT (see `LICENSE`). Data: 10x Genomics public pbmc3k dataset. Built with
[Scanpy](https://scanpy.readthedocs.io) and [Quarto](https://quarto.org).
