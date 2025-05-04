rule normalization:
    input:
        "results/qc_filtered_seurat.rds"
    output:
        "results/normalized_seurat.rds"
    conda:
        "../envs/seurat.yaml"
    script:
        "../scripts/normalization.R"
