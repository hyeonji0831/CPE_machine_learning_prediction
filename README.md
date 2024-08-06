# Machine learning approaches to predict carbapenemase-producing Enterobacterales colonization upon admission in intensive care units

This study aims to predict 'CPE or not' by developing machine learning models for the isolation of patients who are suspected of infection.

## Abstract

### Introduction
Carbapenemase-producing Enterobacterales (CPE) infections are a significant concern in healthcare settings, particularly in intensive care units (ICUs). Early prediction and isolation of patients colonized with CPE upon admission can help prevent the spread of these infections.

### Methods
We developed and evaluated various machine learning models to predict CPE colonization using clinical and demographic data from ICU admissions. The models were trained on a dataset from 2022 and validated on a separate dataset from 2023. Data augmentation techniques, such as SMOTE, were applied to address class imbalance.

### Results
Logistic regression demonstrated the best performance among the models tested, with notable improvements when using augmented data. Performance metrics, including ROC-AUC and PR-AUC, were used to evaluate the models.

### Conclusion
Machine learning models, particularly logistic regression, can effectively predict CPE colonization upon ICU admission. These models can aid in early identification and isolation of at-risk patients, potentially reducing the spread of CPE in healthcare settings.

## Data Description

### Training Dataset
- **Source**: Collected from a tertiary referral hospital ICU in 2022.
- **Size**: 1992 patients
- **CPE Positive**: 220 (11%)
- **CPE Negative**: 1772 (89%)

### Validation Dataset
- **Source**: Collected from a tertiary referral hospital ICU in 2023.
- **Size**: 2923 patients
- **CPE Positive**: 233 (8%)
- **CPE Negative**: 2690 (92%)

## Quick Start

### Installation
1. **Clone the Repository:**
    ```bash
    git clone https://github.com/yourusername/CPE_machine_learning_prediction.git
    cd CPE_machine_learning_prediction
    ```

2. **Install Required Packages:**
    - For Python:
      ```bash
      pip install -r requirements.txt
      ```
    - For R, you can install the required packages directly within your R scripts as shown:
      ```r
      install.packages("readxl")
      install.packages("dplyr")
      install.packages("tableone")
      install.packages("officer")
      install.packages("flextable")
      install.packages("broom")
      install.packages("car")
      install.packages("MASS")
      install.packages("caret")
      ```

### Usage
1. **Data Preparation:**
    - Upload your datasets to the `data/` directory in the repository.
    - Ensure the datasets are named appropriately as referenced in the scripts (e.g., `CPE_training_dataset_2022.xlsx` and `CPE_validation_dataset_2023.xlsx`).

2. **Running the Scripts:**
    - **R Scripts:**
      - Open each R script in RStudio or your preferred R environment and run them to generate the respective tables.
      - Example for Table 1:
        ```r
        source("R code for Table 1.R")
        ```
    - **Python Notebook:**
      - Open `Python code for Table 3,4.ipynb` in Jupyter Notebook or Google Colab and run the cells sequentially to perform the analysis and generate the results.

### Directory Structure
Here’s an overview of the project structure:

