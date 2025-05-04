rule dimreduction:
    input:
        "results/batch_corrected_seurat.rds"
    output:
        "results/dimred_seurat.rds"
    conda:
        "../envs/seurat.yaml"
    script:
        "../scripts/dimreduction.R"
