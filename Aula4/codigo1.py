import numpy as np
from sklearn import datasets
from sklearn.model_selection import train_test_split, cross_val_score, StratifiedKFold
from sklearn.preprocessing import StandardScaler
from sklearn.svm import SVC
from sklearn.metrics import roc_auc_score

# 1. Carregar dados de exemplo (classificação binária)
data = datasets.load_breast_cancer()
X = data.data
y = data.target

# 2. Padronizar os dados (Essencial para SVM)
scaler = StandardScaler()
X_scaled = scaler.fit_transform(X)

# 3. Configurar o SVM
# Nota: probability=True é necessário para calcular AUC se fôssemos usar predict_proba
# diretamente, mas cross_val_score com roc_auc funciona com a decisão de distância.
svm_model = SVC(kernel='rbf', C=1.0, probability=True, random_state=42)

# 4. Configurar a Validação Cruzada (K-Fold Estratificado)
# Garante que a proporção das classes seja mantida em cada dobra.
cv = StratifiedKFold(n_splits=5, shuffle=True, random_state=42)

# 5. Avaliar o modelo usando Cross-Validation e AUC
# O scoring='roc_auc' calcula a área sob a curva para cada dobra.
auc_scores = cross_val_score(svm_model, X_scaled, y, cv=cv, scoring='roc_auc')

# 6. Resultados
print(f"AUC em cada dobra: {auc_scores}")
print(f"AUC Média: {np.mean(auc_scores):.4f}")
print(f"Desvio Padrão da AUC: {np.std(auc_scores):.4f}")

# --- Opcional: Treinar no conjunto total e ver a curva ---
# X_train, X_test, y_train, y_test = train_test_split(X_scaled, y, test_size=0.3)
# svm_model.fit(X_train, y_train)
# y_pred_prob = svm_model.predict_proba(X_test)[:, 1]
# print(f"AUC Final (exemplo treino/teste): {roc_auc_score(y_test, y_pred_prob):.4f}")