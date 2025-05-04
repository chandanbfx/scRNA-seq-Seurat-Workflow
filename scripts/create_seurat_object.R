library(Seurat)
library(Matrix)

data_dir <- "data/pbmc3k_filtered_gene_bc_matrices"
data <- Read10X(data.dir = data_dir)
seurat_obj <- CreateSeuratObject(counts = data, project = "pbmc3k")
saveRDS(seurat_obj, file = "results/seurat_object.rds")
