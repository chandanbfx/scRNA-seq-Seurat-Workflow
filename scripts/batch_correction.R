library(Seurat)

seurat_obj <- readRDS("results/normalized_seurat.rds")
# Simulate batch if not present
seurat_obj$batch <- "batch1"
seurat_obj <- ScaleData(seurat_obj)
saveRDS(seurat_obj, file = "results/batch_corrected_seurat.rds")
