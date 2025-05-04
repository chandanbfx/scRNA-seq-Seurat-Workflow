rule batch_correction:
    input:
        "results/normalized_seurat.rds"
    output:
        "results/batch_corrected_seurat.rds"
    conda:
        "../envs/seurat.yaml"
    script:
        "../scripts/batch_correction.R"
