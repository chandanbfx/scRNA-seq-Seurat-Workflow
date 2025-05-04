rule qc:
    input:
        "results/seurat_object.rds"
    output:
        "results/qc_filtered_seurat.rds"
    conda:
        "../envs/seurat.yaml"
    script:
        "../scripts/qc.R"
