library(Seurat)

seurat_obj <- readRDS("results/qc_filtered_seurat.rds")
seurat_obj <- NormalizeData(seurat_obj)
seurat_obj <- FindVariableFeatures(seurat_obj)
saveRDS(seurat_obj, file = "results/normalized_seurat.rds")
