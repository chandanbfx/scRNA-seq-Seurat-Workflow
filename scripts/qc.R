library(Seurat)

seurat_obj <- readRDS("results/seurat_object.rds")
seurat_obj[["percent.mt"]] <- PercentageFeatureSet(seurat_obj, pattern = "^MT-")
seurat_obj <- subset(seurat_obj, subset = nFeature_RNA > 200 & percent.mt < 5)
saveRDS(seurat_obj, file = "results/qc_filtered_seurat.rds")
