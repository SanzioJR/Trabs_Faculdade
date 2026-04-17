# 1. Instalar e carregar o pacote frbs
if(!require(frbs)) install.packages("frbs")
library(frbs)
###############################################################
## 1. The following codes show how to generate a fuzzy model
## using the frbs.gen function for regression tasks.
## The following are three scenarios:
## 1a. Using the Mamdani model
## 1b. Using the Takagi Sugeno Kang model
## 1c. Using the Mamdani model and internal functions: fuzzifier, etc.
## Note:
## In the examples, let us consider four input variabels and one output variable.
## Some variables could be shared together for other examples.
###############################################################
## Define shape and parameters of membership functions of input variables.
## Please see the fuzzifier function to construct the matrix.
## It can be seen that in this case we employ TRAPEZOID as the membership functions.
varinp.mf <- matrix(c(2, 0, 20, 40, NA, 4, 20, 40, 60, 80, 3, 60, 80, 100, NA,
                      2, 0, 35, 75, NA, 3, 35, 75, 100, NA,
                      2, 0, 20, 40, NA, 1, 20, 50, 80, NA, 3, 60, 80, 100, NA,
                      2, 0, 20, 40, NA, 4, 20, 40, 60, 80, 3, 60, 80, 100, NA),
                    nrow = 5, byrow = FALSE)
## Define number of linguistic terms of the input variables.
## Suppose, we have 3, 2, 3, and 3 numbers of linguistic terms
## for the first, second, third and fourth variables, respectively.
num.fvalinput <- matrix(c(3, 2, 3, 3), nrow=1)
## Give the names of the linguistic terms of each input variables.
varinput.1 <- c("a1", "a2", "a3")
varinput.2 <- c("b1", "b2")
varinput.3 <- c("c1", "c2", "c3")
varinput.4 <- c("d1", "d2", "d3")
names.varinput <- c(varinput.1, varinput.2, varinput.3, varinput.4)
## Set interval of data.
range.data <- matrix(c(0,100, 0, 100, 0, 100, 0, 100, 0, 100), nrow=2)
## Define inference parameters.
type.defuz <- "WAM"
type.tnorm <- "MIN"
type.snorm <- "MAX"
type.implication.func <- "ZADEH"
## Give the name of simulation.
name <- "sim-0"
## Provide new data for testing.
newdata <- matrix(c(15, 80, 85, 85, 45, 75, 78, 70), nrow = 2, byrow = TRUE)
## the names of variables
colnames.var <- c("input1", "input2", "input3", "input4", "output1")

###############################################################
## 1a. Using the Mamdani Model
###############################################################
## Define number of linguistic terms of output variable.
## In this case, we set the number of linguistic terms to 3.
num.fvaloutput <- matrix(c(3), nrow = 1)
## Give the names of the linguistic terms of the output variable.
varoutput.1 <- c("e1", "e2", "e3")
names.varoutput <- c(varoutput.1)
## Define the shapes and parameters of the membership functions of the output variables.
varout.mf <- matrix(c(2, 0, 20, 40, NA, 4, 20, 40, 60, 80, 3, 60, 80, 100, NA),
                    nrow = 5, byrow = FALSE)
## Set type of model which is "MAMDANI" or "TSK" for Mamdani or
## Takagi Sugeno Kang models, respectively.
## In this case, we choose the Mamdani model.
type.model <- "MAMDANI"
## Define the fuzzy IF-THEN rules; In this case, we provide two scenarios using different operators:
rule.or <- matrix(c("a1", "or", "b1", "or", "c1", "or", "d1", "->", "e1",
                    "a2", "and", "b2", "and", "c2", "and", "d2", "->", "e2",
                    "a3", "and", "b2", "and", "c2", "and", "d1", "->", "e3"),
                  nrow = 3, byrow = TRUE)
## Define the fuzzy IF-THEN rules;
rule.and <- matrix(c("a1", "and", "b1", "and", "c1", "and", "d1", "->", "e1",
                     "a2", "and", "b2", "and", "c2", "and", "d2", "->", "e2",
                     "a3", "and", "b2", "and", "c2", "and", "d1", "->", "e3"),
                   nrow = 3, byrow = TRUE)
## Generate a fuzzy model with frbs.gen.
object.or <- frbs.gen(range.data, num.fvalinput, names.varinput,
                      num.fvaloutput, varout.mf, names.varoutput, rule.or,
                      varinp.mf, type.model, type.defuz, type.tnorm,
                      type.snorm, func.tsk = NULL, colnames.var, type.implication.func, name)
object.and <- frbs.gen(range.data, num.fvalinput, names.varinput,
                       num.fvaloutput, varout.mf, names.varoutput, rule.and,
                       varinp.mf, type.model, type.defuz, type.tnorm,
                       type.snorm, func.tsk = NULL, colnames.var, type.implication.func, name)
## Plot the membership function.
plotMF(object.and)
## Predicting using new data.
res.or <- predict(object.or, newdata)$predicted.val
res.and <- predict(object.and, newdata)$predicted.val