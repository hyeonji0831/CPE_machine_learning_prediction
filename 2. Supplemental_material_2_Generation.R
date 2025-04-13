# Install and load necessary packages
install.packages("readxl")
install.packages("dplyr")
install.packages("tableone")
install.packages("openxlsx")

# Load necessary libraries
library(readxl)
library(dplyr)
library(tableone)
library(openxlsx)

# 1. Load the training and validation datasets from Excel files
training_data <- read_excel("CPE_training_dataset_2022.xlsx")
validation_data <- read_excel("CPE_validation_dataset_2023.xlsx")

# 2. Add group information and merge the datasets
training_data$group <- "training"
validation_data$group <- "validation"
combined_data <- bind_rows(training_data, validation_data)

# 3. Define continuous and categorical variables
continuous_vars <- c("Age", "Hospital days before ICU admission")
categorical_vars <- setdiff(names(training_data), c("CPE", continuous_vars))

# 4. Create the TableOne object stratified by 'group'
table1 <- CreateTableOne(vars = c("CPE", continuous_vars, categorical_vars),
                         strata = "group", 
                         data = combined_data, 
                         factorVars = c("CPE", categorical_vars))

# 5. Generate the summary table (with median & IQR for continuous variables)
table1_print <- print(table1, nonnormal = continuous_vars, quote = FALSE, noSpaces = TRUE, printToggle = FALSE)

# 6. Convert the output to a data frame and add row names as a column
table1_df <- as.data.frame(table1_print)
table1_df <- cbind(Characteristic = rownames(table1_df), table1_df)
rownames(table1_df) <- NULL

# 7. Save the summary table to an Excel file
write.xlsx(table1_df, file = "Supplemental_Table1.xlsx")