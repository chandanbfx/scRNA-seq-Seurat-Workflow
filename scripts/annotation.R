library(Seurat)

seurat_obj <- readRDS(snakemake@input[["seurat"]])
# Manual example: use cluster ID to assign cell types based on marker gene inspection
Idents(seurat_obj) <- "seurat_clusters"
celltype_map <- c("0" = "Naive T", "1" = "Memory T", "2" = "B cell", "3" = "NK", "4" = "Monocyte")
seurat_obj$celltype <- plyr::mapvalues(as.character(Idents(seurat_obj)), from = names(celltype_map), to = celltype_map)
saveRDS(seurat_obj, file = snakemake@output[[1]])
