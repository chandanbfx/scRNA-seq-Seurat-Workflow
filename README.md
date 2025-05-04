# Single-cell RNA-seq Analysis using Seurat (PBMC 3K)

This project is a modular and reproducible Snakemake workflow for single-cell RNA-seq analysis using the **Seurat** R package. The goal is to process, analyze, and visualize PBMC 3K dataset from 10x Genomics, providing a clear path from raw count matrices to meaningful biological insights like clustering, marker detection, and cell type annotation.

## Overview

We process the PBMC 3K dataset through the following key steps:

1. Create a Seurat object from 10x raw count matrices.
2. Perform quality control filtering.
3. Normalize and scale the data.
4. Identify highly variable genes.
5. Conduct dimensionality reduction (PCA, UMAP).
6. Cluster the cells.
7. Identify marker genes for each cluster.
8. Annotate cell types based on known markers.
9. Generate summary figures and tables for publication-ready insights.

## Input Data

The raw data used is publicly available from 10x Genomics. Download it using the following URL:

```bash
curl -L -o pbmc3k_filtered_gene_bc_matrices.tar.gz https://cf.10xgenomics.com/samples/cell/pbmc3k/pbmc3k_filtered_gene_bc_matrices.tar.gz
mkdir -p data/pbmc3k
tar -xzf pbmc3k_filtered_gene_bc_matrices.tar.gz -C raw_data/ --strip-components=1
```

After downloading, extract the files into a directory structure like:

```
data/
└── pbmc3k_filtered_gene_bc_matrices/
    ├── matrix.mtx
    ├── barcodes.tsv
    └── genes.tsv
```

## Running the Workflow

Make sure you have Snakemake installed. Then run:

```bash
snakemake --use-conda --cores 4
```

This will automatically create the required conda environments and run all analysis steps.

## Project Structure

```
.
├── data/                         # Raw input files (10x format)
├── results/                      # Output results (plots, tables, annotated objects)
├── envs/                         # Conda environment YAMLs
├── rules/                        # Modular Snakemake rules (*.smk)
├── scripts/                      # R scripts used in the workflow
├── Snakefile                     # Main workflow file
├── config.yaml                   # Configuration for paths and parameters
└── README.md                     # You're reading it!
```

## Dependencies

All tools and R packages are automatically managed through `conda`. A compatible environment is built using:

- R + Seurat
- cowplot, ggplot2, Matrix, dplyr, patchwork, etc.

## Acknowledgements

- Seurat: https://satijalab.org/seurat/
- Snakemake: https://snakemake.readthedocs.io/
- 10x Genomics PBMC 3K Dataset: https://www.10xgenomics.com/resources/datasets/pbmc-3k-1-standard-3-0-0

## Notes

This project is meant to be a clean, human-readable Snakemake implementation to help users process single-cell data in R/Seurat, not a black-box pipeline. It is especially useful for educational, academic, or exploratory use.
