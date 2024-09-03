#!/usr/bin/env Rscript

# Comentário: Isso é um comentário em R

# 1. Variáveis e Tipos de Dados
cat("1. Variáveis e Tipos de Dados\n")
nome <- "Alice"  # String
idade <- 30      # Inteiro
altura <- 1.65   # Float
is_student <- TRUE  # Booleano

cat("Nome:", nome, ", Idade:", idade, ", Altura:", altura, ", Estudante:", is_student, "\n\n")

# 2. Operações Matemáticas
cat("2. Operações Matemáticas\n")
a <- 10
b <- 5
cat("a =", a, ", b =", b, "\n")
cat("Soma:", a + b, "\n")
cat("Subtração:", a - b, "\n")
cat("Multiplicação:", a * b, "\n")
cat("Divisão:", a / b, "\n")
cat("Divisão Inteira:", a %/% b, "\n")
cat("Resto da Divisão:", a %% b, "\n")
cat("Exponenciação:", a ^ b, "\n\n")

# 3. Vetores
cat("3. Vetores\n")
frutas <- c("maçã", "banana", "laranja")
cat("Vetor de frutas:", frutas, "\n")
frutas <- c(frutas, "uva")  # Adicionar um item ao vetor
cat("Vetor de frutas após adicionar 'uva':", frutas, "\n")
cat("Primeira fruta:", frutas[1], "\n")
cat("Última fruta:", frutas[length(frutas)], "\n\n")

# 4. Loops
cat("4. Loops\n")
cat("Loop for:\n")
for (fruta in frutas) {
  cat(fruta, "\n")
}

cat("\nLoop while:\n")
contador <- 0
while (contador < 3) {
  cat(contador, "\n")
  contador <- contador + 1
}
cat("\n")

# 5. Condicionais
cat("5. Condicionais\n")
numero <- 7
if (numero > 10) {
  cat(numero, "é maior que 10\n")
} else if (numero == 10) {
  cat(numero, "é igual a 10\n")
} else {
  cat(numero, "é menor que 10\n")
}
cat("\n")

# 6. Funções
cat("6. Funções\n")
saudacao <- function(nome) {
  return(paste("Olá,", nome, "!"))
}

mensagem <- saudacao("Bob")
cat(mensagem, "\n")

soma <- function(x, y) {
  return(x + y)
}

resultado <- soma(3, 4)
cat("A soma de 3 e 4 é:", resultado, "\n\n")

# 7. Listas
cat("7. Listas\n")
pessoa <- list(
  nome = "Carlos",
  idade = 28,
  cidade = "São Paulo"
)
cat("Nome:", pessoa$nome, "\n")
cat("Idade:", pessoa$idade, "\n")
cat("Cidade:", pessoa$cidade, "\n\n")

# 8. Manipulação de Strings
cat("8. Manipulação de Strings\n")
texto <- "  Olá, Mundo!  "
cat("Texto original: '", texto, "'\n")
cat("Texto em minúsculas: '", tolower(texto), "'\n")
cat("Texto em maiúsculas: '", toupper(texto), "'\n")
cat("Texto sem espaços em branco: '", trimws(texto), "'\n")
cat("Texto substituindo 'Mundo' por 'R': '", sub("Mundo", "R", texto), "'\n")

cat("\nScript finalizado!\n")
