# Install and load necessary packages
install.packages("readxl")
install.packages("dplyr")
install.packages("tableone")

library(readxl)
library(dplyr)
library(tableone)


# Load the training and validation datasets from Excel files
training_data <- read_excel("CPE_training_dataset_2022.xlsx")
validation_data <- read_excel("CPE_validation_dataset_2023.xlsx")

# Add group information to each dataset
training_data$group <- "training"
validation_data$group <- "validation"

# Combine the two datasets
combined_data <- bind_rows(training_data, validation_data)

# Define the lists of continuous and categorical variables
continuous_vars <- c("age", "ICU_adm_day")
categorical_vars <- setdiff(names(training_data), c("CPE", continuous_vars))

# Create TableOne object, stratified by the group
table1 <- CreateTableOne(vars = c("CPE", continuous_vars, categorical_vars), strata = "group", data = combined_data, factorVars = c("CPE", categorical_vars))

# Print TableOne with median and IQR for continuous variables
table1_print <- print(table1, nonnormal = continuous_vars, quote = FALSE, noSpaces = TRUE, printToggle = FALSE)

# View the printed table in the R environment
View(table1_print)
