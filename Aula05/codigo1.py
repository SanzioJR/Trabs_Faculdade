# Instalação: pip install fuzzy-c-means
import numpy as np
!pip install fuzzy-c-means
from fcmeans import FCM
from sklearn.datasets import make_blobs
from matplotlib import pyplot as plt


# 1. Criar dataset artificial
X, _ = make_blobs(n_samples=500, centers=3, n_features=2, random_state=42)

# 2. Fit do modelo FCM
fcm = FCM(n_clusters=3)
fcm.fit(X)

# 3. Obter resultados
fcm_centers = fcm.centers
fcm_labels = fcm.u.argmax(axis=1)  # Rótulos finais baseados na maior pertinência

# 4. Visualizar
plt.scatter(X[:, 0], X[:, 1], c=fcm_labels, alpha=0.5)
plt.scatter(fcm_centers[:, 0], fcm_centers[:, 1], marker='+', s=200, c='red')
plt.show()
