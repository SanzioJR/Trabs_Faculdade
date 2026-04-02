# 1. Instalar e carregar o pacote necessário
if(!require(randomForest)) install.packages("randomForest")
library(randomForest)

# 2. Carregar o conjunto de dados (iris)
data(iris)
str(iris) # visualizar a estrutura dos dados

# 3. Preparar os dados: Dividir em conjunto de treino (80%) e teste (20%)
set.seed(123) # Definir semente para reprodutibilidade
indices <- sample(1:nrow(iris), 0.8 * nrow(iris))
treino <- iris[indices, ]
teste <- iris[-indices, ]

# 4. Treinar o modelo Random Forest
# Species é a variável alvo, '.' indica usar todas as outras variáveis
modelo_rf <- randomForest(Species ~ .,
                         data = treino,
                         ntree = 100,      # Número de árvores
                         mtry = 2,         # Número de variáveis aleatórias por divisão
                         importance = TRUE) # Calcular importância das variáveis

# Exibir o modelo
print(modelo_rf)

# 5. Fazer previsões no conjunto de teste
previsoes <- predict(modelo_rf, teste)

# 6. Avaliar o modelo (Matriz de Confusão)
matriz_confusao <- table(Previsoes = previsoes, Real = teste$Species)
print(matriz_confusao)

# calcular acurácia
acuracia <- sum(diag(matriz_confusao)) / sum(matriz_confusao)
cat("Acurácia do Modelo:", round(acuracia * 100, 2), "%\n")

# 7. visualizar a importância das variáveis
importance(modelo_rf)
varImpPlot(modelo_rf)