rule create_seurat_object:
    input:
        matrix="data/pbmc3k_filtered_gene_bc_matrices/matrix.mtx",
        genes="data/pbmc3k_filtered_gene_bc_matrices/genes.tsv",
        barcodes="data/pbmc3k_filtered_gene_bc_matrices/barcodes.tsv"
    output:
        rds="results/seurat_object.rds"
    conda:
        "../envs/seurat.yaml"
    script:
        "../scripts/create_seurat_object.R"
