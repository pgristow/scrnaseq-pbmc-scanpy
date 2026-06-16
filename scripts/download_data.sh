#!/usr/bin/env bash
# Download the 10x Genomics 3k PBMC dataset (filtered gene-barcode matrices).
# Public, freely redistributable demo data from 10x Genomics.
set -euo pipefail

DATA_DIR="${DATA_DIR:-data}"
URL="https://cf.10xgenomics.com/samples/cell/pbmc3k/pbmc3k_filtered_gene_bc_matrices.tar.gz"
TARBALL="${DATA_DIR}/pbmc3k_filtered_gene_bc_matrices.tar.gz"

mkdir -p "${DATA_DIR}"

if [ -d "${DATA_DIR}/filtered_gene_bc_matrices/hg19" ]; then
  echo "[download_data] Matrix already present in ${DATA_DIR}/filtered_gene_bc_matrices/hg19 — skipping."
  exit 0
fi

echo "[download_data] Fetching pbmc3k (~7 MB)..."
curl -fsSL "${URL}" -o "${TARBALL}"
tar -xzf "${TARBALL}" -C "${DATA_DIR}"
rm -f "${TARBALL}"
echo "[download_data] Done -> ${DATA_DIR}/filtered_gene_bc_matrices/hg19"
