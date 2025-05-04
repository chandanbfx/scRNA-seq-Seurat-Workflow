rule generate_summary:
    input:
        seurat="results/annotated_seurat.rds"
    output:
        summary="results/stats/summary_table.tsv",
        violin="results/qc_plots/violin_qc.png",
        umap="results/dimred_plots/umap_clusters.png",
        heatmap="results/markers/heatmap_top_markers.png"
    conda:
        "../envs/seurat.yaml"
    script:
        "../scripts/summary_stats.R"
