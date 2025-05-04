rule annotation:
    input:
        seurat="results/seurat_markers.rds",
        markers="results/marker_genes.tsv"
    output:
        "results/annotated_seurat.rds"
    conda:
        "../envs/seurat.yaml"
    script:
        "../scripts/annotation.R"
