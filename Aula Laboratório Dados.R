## INSTALANDO O BANCO DE DADOS DO BANCO MUNDIAL ####
# install.packages("WDI") #instalar o pacote
library(WDI) #Carregar o pacote

PIB <- WDIsearch("GDP") #Dados da renda (PIB)

##AULA 1 ####
# x = PIB(NY.GDP.MKTP.CD, GDP(current US$))



#AULA 2

#TIRAR NOTAÇÃO CIENTÍFICA 
options(scipen=999)

#EXCLUIR UMA BASE
# dadosbrcomple <- NULL

# VARIÁVEIS ####

# PIB A PREÇOS CORRENTES (US$): NY.GDP.MKTP.CD
# DESPESAS DE CONSUMO PESSOAL, PC/US$: NE.CON.PRVT.CD

# infos: http://vincentarelbundock.github.io/WDI/

PIB_vars <- WDIsearch('gdp') # GDP = PIB (TODOS)
TODO_BM <- WDIsearch('') #TODAS AS VAR. DO BM

variaveis <- c('NY.GDP.MKTP.CD',
               'NE.CON.PRVT.CD')

populacao_e_taxa_de_desemprego <- c('SP.POP.TOTL',
                                    'SL.UEM.TOTL.ZS')

#BASE DE DADOS DE CORTE TRANSVERSAL ####
dados <- WDI(indicator = variaveis,
             country = 'all', #TODOS = 'all'
             start = 2022, end = 2022) #PROBLEMA DE NA(sem dados para todos os países)

# install.packages("tidyverse")
library(tidyverse)

dadosok <- WDI(indicator = variaveis,
               country = 'all', #TODOS = 'all'
               start = 2022, end = 2022) %>% #ctrl shift M
  na.omit()

#BASE DE DADOS DA PPW (BRASIL)
dadosbr <- WDI(indicator = variaveis,
               country = 'BR', #CODIGO Iso2C
               start = 1961, end = 2018)

dadosbrcomple <- WDI(indicator = variaveis,
                   country = 'BR')

# A PARTIR DA AULA DE ONTEM DE ECONOMETRIA (AULA 2.R)
# BUSQUE DUAS VARIÁVEIS DE SEU INTERESSE NO BANCO MUNDIAL
# CRIE UM ARQUIVO DE DADOS DE TODOS OS PAISES PARA 2022, POR EXEMPLO
# UM ARQUIVO DE DADOS DO BRASIL (TODO PERIODO)

# BASE DE DADOS TODOS OS PAISES 2022 ####
dados_2022 <- WDI(indicator = populacao_e_taxa_de_desemprego,
                   country = 'all', # PARA TODOS OS PAISES
                  start = 2022, end = 2022)

#BASE DE DADOS DO BRASIL TODO O PERÍODO ####
dados_taxa_desemprego <- WDI(indicator = populacao_e_taxa_de_desemprego,
               country = 'BR', # CODIGO ISO DO BRASIL
               start = 1961, end = 2024)

#populacao <- NULL

#taxa_de_desemprego <- NULL
