library(Seurat)

seurat_obj <- readRDS("results/dimred_seurat.rds")
seurat_obj <- FindNeighbors(seurat_obj, dims = 1:10)
seurat_obj <- FindClusters(seurat_obj)
saveRDS(seurat_obj, file = "results/clusters_seurat.rds")
