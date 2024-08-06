# Install required libraries
install.packages("readxl")
install.packages("dplyr")
install.packages("broom")
install.packages("purrr")
install.packages("car")
install.packages("MASS")
install.packages("caret")

# Load necessary libraries
library(readxl)
library(dplyr)
library(broom)
library(purrr)
library(car)
library(MASS)
library(caret)

# Data Loading
# Load the training data from an Excel file
training_data <- read_excel("CPE_training_dataset_2022.xlsx")

# Set dependent and independent variables
dependent_var <- "CPE"
independent_vars <- setdiff(names(training_data), dependent_var)

# Perform Univariate Analysis
univariate_results <- map_dfr(independent_vars, ~ {
  formula <- as.formula(paste(dependent_var, "~", .x))
  model <- glm(formula, data = training_data, family = binomial)
  results <- tidy(model, conf.int = TRUE)
  term <- .x
  OR <- round(exp(results$estimate[2]), 2)
  conf.low <- round(exp(results$conf.low[2]), 2)
  conf.high <- round(exp(results$conf.high[2]), 2)
  p.value <- round(results$p.value[2], 2)
  data.frame(
    term = term,
    OR = OR,
    CI = paste0(conf.low, "-", conf.high),
    p.value = p.value
  )
})

# Output univariate analysis results
print(univariate_results)

# Select significant variables with p-value < 0.05
significant_vars <- univariate_results %>%
  filter(p.value < 0.05) %>%
  pull(term)

# Output significant variables
print(significant_vars)

# Create a dataframe with only significant variables
significant_data <- training_data[, c(dependent_var, significant_vars)]

# Calculate VIF using the full model with significant variables
significant_formula <- as.formula(paste(dependent_var, "~", paste(significant_vars, collapse = " + ")))
full_model <- glm(significant_formula, data = training_data, family = binomial)

# Calculate and output VIF values
vif_values <- vif(full_model)
print(vif_values)

# Calculate correlation matrix
cor_matrix <- cor(significant_data[, significant_vars], use = "complete.obs")

# Detect and output pairs of variables with correlation > 0.3
threshold <- 0.3
high_corr_pairs <- which(abs(cor_matrix) > threshold & abs(cor_matrix) < 1, arr.ind = TRUE)
high_corr_pairs <- high_corr_pairs[high_corr_pairs[,1] < high_corr_pairs[,2], ]

high_corr_results <- data.frame(
  Var1 = rownames(cor_matrix)[high_corr_pairs[,1]],
  Var2 = colnames(cor_matrix)[high_corr_pairs[,2]],
  Correlation = cor_matrix[high_corr_pairs]
)

print(high_corr_results)

# Create the final model with the selected variables
selected_vars <- c("ICU_adm_day", "OP", "ESRD_HD", "Chemo", 
                   "FQ_3Mo", "Carb_3Mo", "AG_3Mo", "C_line", 
                   "PCD", "PTBD", "LTCF", "MDRO", "GI_scope")

final_formula <- as.formula(paste(dependent_var, "~", paste(selected_vars, collapse = " + ")))
final_model <- glm(final_formula, data = training_data, family = binomial)

# Summary of the final model
summary(final_model)

# Organize and output final model results
final_results <- tidy(final_model, conf.int = TRUE) %>%
  mutate(
    OR = round(exp(estimate), 2),
    conf.low = round(exp(conf.low), 2),
    conf.high = round(exp(conf.high), 2),
    p.value = round(p.value, 2)
  ) %>%
  arrange(p.value)

print(final_results)
