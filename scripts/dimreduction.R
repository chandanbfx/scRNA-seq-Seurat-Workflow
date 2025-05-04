library(Seurat)

seurat_obj <- readRDS("results/batch_corrected_seurat.rds")
seurat_obj <- RunPCA(seurat_obj)
seurat_obj <- RunUMAP(seurat_obj, dims = 1:10)
saveRDS(seurat_obj, file = "results/dimred_seurat.rds")
