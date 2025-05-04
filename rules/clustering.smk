rule clustering:
    input:
        "results/dimred_seurat.rds"
    output:
        "results/clusters_seurat.rds"
    conda:
        "../envs/seurat.yaml"
    script:
        "../scripts/clustering.R"
