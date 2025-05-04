library(Seurat)
seurat_obj <- readRDS("results/clusters_seurat.rds")

markers <- FindAllMarkers(seurat_obj, only.pos = TRUE, min.pct = 0.25)
write.table(markers, file = "results/marker_genes.tsv", sep = "\t", quote = FALSE, row.names = FALSE)
saveRDS(seurat_obj, file = "results/seurat_markers.rds")
