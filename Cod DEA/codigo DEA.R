# Caminho do arquivo
file_path <- 'C:/Users/Samsung/Downloads/dea.csv'

# Lê o arquivo CSV
arquivo <- read.csv(file_path, header = TRUE)

# Verifica os nomes das colunas do dataframe
names(arquivo)

# Carrega bibliotecas necessárias
library(carData)
library(car)
library(DJL)

# Define os inputs (X) e outputs (Y) para a Análise Envoltória de Dados (DEA)
X <- data.frame(x1 = arquivo$Qtd.Rotas)     # Seleciona diretamente a coluna
Y <- data.frame(y1 = arquivo$QtdTransp)

# Executa DEA com orientação input (minimizar insumos mantendo os produtos fixos)
res.ccr_input <- dm.dea(xdata = X, ydata = Y, rts = 'crs', orientation = 'i')

# Executa DEA com orientação output (maximizar produtos mantendo os insumos fixos)
res.ccr_output <- dm.dea(xdata = X, ydata = Y, rts = 'crs', orientation = 'o')

# Cria um dataframe com os resultados das eficiências
resultados <- data.frame(CCR_Input = res.ccr_input$eff,
                         CCR_Output = res.ccr_output$eff)

# Mostra o resultado
print(resultados)
