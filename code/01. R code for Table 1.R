# Install and load necessary packages
install.packages("readxl")
install.packages("dplyr")
install.packages("tableone")

library(readxl)
library(dplyr)
library(tableone)

# Load the data from an Excel file
data <- read_excel("CPE_training_dataset_2022.xlsx")

# Define variable lists
continuous_vars <- c("age", "ICU_adm_day")
categorical_vars <- setdiff(names(data), c("CPE", continuous_vars))

# Create TableOne object
table1 <- CreateTableOne(vars = c(continuous_vars, categorical_vars), strata = "CPE", data = data, factorVars = categorical_vars)

# Print TableOne with median and IQR for continuous variables
table1_print <- print(table1, nonnormal = continuous_vars, quote = FALSE, noSpaces = TRUE)