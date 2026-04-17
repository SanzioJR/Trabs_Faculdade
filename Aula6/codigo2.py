import numpy as np
import matplotlib.pyplot as plt
from sklearn.cluster import KMeans
from mpl_toolkits.mplot3d import Axes3D

# 1. Generate synthetic 3D data
np.random.seed(5)
X = np.random.rand(300, 3) * 100
X[50:150, :] += 50
X[150:250, :] -= 50

# 2. Apply K-means clustering
n_clusters = 3
kmeans = KMeans(n_clusters=n_clusters, init='k-means++', n_init=10, random_state=0)
kmeans.fit(X)
labels = kmeans.predict(X)
centroids = kmeans.cluster_centers_

# 3. Visualize the clusters in 3D
fig = plt.figure(figsize=(10, 8))
ax = fig.add_subplot(111, projection='3d')
ax.scatter(X[:, 0], X[:, 1], X[:, 2], c=labels, cmap='viridis', s=40)
ax.scatter(centroids[:, 0], centroids[:, 1], centroids[:, 2], marker='x', c='red', s=150, linewidths=3, label='Centroids')
ax.set_title('K-Means Clustering in 3D')
ax.set_xlabel('Feature 1')
ax.set_ylabel('Feature 2')
ax.set_zlabel('Feature 3')
ax.legend()
plt.show()