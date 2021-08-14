install.packages(c("OpenImageR", "ClusterR"))
install.packages("Rcpp")
library(OpenImageR)
library(ClusterR)
library(Rcpp)

img <- readImage("../data/tema5/bird.jpg")

img.resize <- resizeImage(img, 350, 350,
                          method = "bilinear")
imageShow(img.resize)

img.vector <- apply(img.resize, 3, as.vector)
dim(img.vector)

kmmb <- MiniBatchKmeans(img.vector, clusters = 64, batch_size = 20, num_init = 5,
                        max_iters = 100, init_fraction = 0.2,
                        initializer = "kmeans++",
                        early_stop_iter = 10, verbose = F)
kmmb

prmb <- predict_MBatchKMeans(img.vector, kmmb$centroids)
prmb

get.cent.mb <- kmmb$centroids
new.img <- get.cent.mb[prmb,]
dim(new.img) <- c(nrow(img.resize), ncol(img.resize), 3)
imageShow(new.img)
