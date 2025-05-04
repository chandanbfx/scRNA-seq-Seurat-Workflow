rule marker_genes:
    input:
        "results/clusters_seurat.rds"
    output:
        "results/marker_genes.tsv",
        "results/seurat_markers.rds"
    conda:
        "../envs/seurat.yaml"
    script:
        "../scripts/marker_genes.R"
