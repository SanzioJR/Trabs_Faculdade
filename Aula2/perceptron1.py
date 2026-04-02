import numpy as np

class Perceptron:
    def __init__(self, taxa_aprendizado=0.01, n_iter=100, random_state=1):
        self.taxa_aprendizado = taxa_aprendizado #Eta (n)
        self.n_iter = n_iter
        self.pesos = None #Vetor de pesos
        self.bias = None #Viés
        self.registro_erros = [] #Para monitorar o aprendizado

    def fit(self, X, y):
        #Inicializa os pesos e bias (pode ser aleatório ou zero)
        self.pesos = np.zeros(n_features)
        self.bias = 0
        self.registro_erros = []

        for _ in range(self.n_iter):
            erros = 0
            for xi, target in zip(X, y):
                #Previsão: função degrau (Heaviside)
                pred= self.ativação(np.dot(xi, self.pesos) + self.bias)

                #atualização dos pesos e bias (Aprendizado Supervisionado)
                erro = target - pred
                if erro != 0:
                    self.pesos += self.taxa_aprendizado * erro * xi
                    self.bias += self.taxa_aprendizado * erro
                    erros += 1
            self.registro_erros.append(erros)
        return self
    
    def ativação(self, z):
        # Função de ativação degrau (Heaviside)
        return np.where(z >= 0, 1, 0)

    def predict(self, X):
        # Aplica a função de ativação das somas ponderadas
        return self.ativação(np.dot(X, self.pesos) + self.bias)