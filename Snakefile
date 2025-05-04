configfile:"config/config.yaml"

include: "rules/create_seurat_object.smk"
include: "rules/qc.smk"
include: "rules/normalization.smk"
include: "rules/batch_correction.smk"
include: "rules/dimreduction.smk"
include: "rules/clustering.smk"
include: "rules/marker_genes.smk"
include: "rules/annotation.smk"
include: "rules/summary_stats.smk"


rule all:
    input:
        "results/annotated_seurat.rds",
        "results/dimred_plots/umap_clusters.png"
