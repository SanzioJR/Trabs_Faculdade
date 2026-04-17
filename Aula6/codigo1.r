# Install necessary package if not already installed:
# install.packages("rgl")
# install.packages("scatterplot3d")

# Load libraries
if(!require(rgl)) install.packages("rgl")
if(!require(scatterplot3d)) install.packages("scatterplot3d")
library(rgl)
library(scatterplot3d)

# 1. Generate a 3D example dataset
set.seed(123) # for reproducibility
# Create a matrix of 100 observations with 3 variables (X, Y, Z)
data_3d <- matrix(rnorm(300), ncol = 3)
colnames(data_3d) <- c("X", "Y", "Z")
# Introduce some structure to make clusters apparent
data_3d[1:50, ] <- data_3d[1:50, ] + 5
data_3d[51:100, ] <- data_3d[51:100, ] - 5

# Convert to a data frame for easier handling
df_3d <- as.data.frame(data_3d)

# 2. Perform K-means clustering
k <- 3 # Define the number of clusters
kmeans_result <- kmeans(df_3d, centers = k, nstart = 25)

# Add the cluster assignment to the data frame
df_3d$cluster <- as.factor(kmeans_result$cluster)

# 3. visualize the clusters in 3D

# Option A: Interactive 3D plot using rgl (Recommended)
# This will open an interactive window you can rotate and zoom
plot3d(df_3d$x, df_3d$y, df_3d$z,
       col = as.numeric(df_3d$cluster), # color points by cluster
       size = 5,
       type = 's', # 's' for spheres
       xlab = "X Axis", ylab = "Y Axis", zlab = "Z Axis",
       main = "3D K-Means Clustering Results")

# Add cluster centers (centroids) to the plot
centers <- as.data.frame(kmeans_result$centers)
with(centers, spheres3d(X, Y, Z, radius = 0.5, color = 1:k, alpha = 0.8))

# Option B: Static 3D plot using scatterplot3d
scatterplot3d(df_3d$X, df_3d$Y, df_3d$Z,
              color = as.numeric(df_3d$cluster),
              main = "3D K-Means Clustering Results",
              xlab = "X Axis", ylab = "Y Axis", zlab = "Z Axis",
              pch = 19)

# Add centers to the static plot
s3d <- scatterplot3d(df_3d$X, df_3d$Y, df_3d$Z, type = "n") # Use "n" to just get coordinates system
s3d$points3d(centers$X, centers$Y, centers$Z, col = 1:k, pch = 8, cex = 2) # pch 8 is a star symbol