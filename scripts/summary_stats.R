library(Seurat)
library(ggplot2)
library(cowplot)
library(dplyr)

seurat_obj <- readRDS(snakemake@input[[1]])

# -------------------------------
# QC Violin Plots
# -------------------------------
violin_plot <- VlnPlot(seurat_obj, features = c("nFeature_RNA", "nCount_RNA", "percent.mt"), 
                       pt.size = 0.1, ncol = 3) + ggtitle("QC Metrics")
ggsave(filename = snakemake@output[["violin"]], plot = violin_plot, width = 10, height = 4)

# -------------------------------
# Dimensionality Reduction Plot
# -------------------------------
umap_plot <- DimPlot(seurat_obj, reduction = "umap", group.by = "seurat_clusters") + ggtitle("UMAP Clusters")
ggsave(filename = snakemake@output[["umap"]], plot = umap_plot, width = 6, height = 5)

# -------------------------------
# Marker Heatmap (Top 5 markers per cluster)
# -------------------------------
# Identify markers
all_markers <- FindAllMarkers(seurat_obj, only.pos = TRUE, min.pct = 0.25, logfc.threshold = 0.25)
top_markers <- all_markers %>% group_by(cluster) %>% top_n(n = 5, wt = avg_log2FC)
top_genes <- top_markers$gene

heatmap <- DoHeatmap(seurat_obj, features = top_genes) + NoLegend()
ggsave(filename = snakemake@output[["heatmap"]], plot = heatmap, width = 10, height = 8)

# -------------------------------
# Summary Table (per cluster)
# -------------------------------
cluster_stats <- seurat_obj@meta.data %>%
  group_by(seurat_clusters) %>%
  summarise(
    n_cells = n(),
    avg_nFeature_RNA = mean(nFeature_RNA),
    avg_nCount_RNA = mean(nCount_RNA),
    avg_percent_mt = mean(percent.mt)
  )

write.table(cluster_stats, file = snakemake@output[["summary"]], sep = "\t", quote = FALSE, row.names = FALSE)
