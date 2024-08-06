# Machine learning approaches to predict carbapenemase-producing Enterobacterales colonization upon admission in intensive care units

This study aims to predict 'CPE or not' by developing machine learning models for the isolation of patients who are suspected of infection.

### Introduction
Carbapenemase-producing Enterobacterales (CPE) infections are a significant concern in healthcare settings, particularly in intensive care units (ICUs). Early prediction and isolation of patients colonized with CPE upon admission can help prevent the spread of these infections.

### Methods
We developed and evaluated various machine learning models to predict CPE colonization using clinical and demographic data from ICU admissions. The models were trained on a dataset from 2022 and validated on a separate dataset from 2023. Data augmentation techniques, SMOTE, was applied to address class imbalance.

### Results
Logistic regression demonstrated the best performance among the models tested, with notable improvements when using augmented data. Performance metrics, including ROC-AUC and PR-AUC, were used to evaluate the models.


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

### Usage
1. **Data Preparation:**
    - Download datasets from the `data/` directory in the repository.
    - Ensure the datasets are named appropriately as referenced in the scripts (e.g., `CPE_training_dataset_2022.xlsx` and `CPE_validation_dataset_2023.xlsx`).

2. **Running the Scripts:**
    - **R Scripts:**
      - Open each R script in RStudio or your preferred R environment and run them to generate the respective tables.
      - Example for Table 1:
        ```r
        source("R code for Table 1.R")
        ```
    - **Python Notebook:**
      - Open `Python code for Table 3,4.ipynb` in Google Colab or Jupyter Notebook and run the cells sequentially to perform the analysis and generate the results.
        
3. **Additional Installation for Windows Users:**
    - If you are using Windows, you might need to install Rtools to compile packages from source:
      - Download and install Rtools from [CRAN](https://cran.r-project.org/bin/windows/Rtools/).
      - After installation, add Rtools to your system PATH.
        
## Code Description

### R Scripts
- **R code for Table 1.R:** Generates the first table with descriptive statistics.
- **R code for Table 2.R:** Creates the second table for the dataset.
- **R code for supplement 1.R:** Produces supplementary data analysis.

### Python Notebook
- **Python code for Table 3,4.ipynb:** Contains the machine learning analysis and model evaluation, including logistic regression and SHAP plots.

## Results
The results from the analysis were saved in the `results/` directory. This includes:

- ROC-AUC and PR-AUC plots
- SHAP summary plots


## FAQ

### How can I reproduce the analysis?
Download dataset, open each R scripts and python code, and follow the flow to reproduce the analysis.

### Where can I find the datasets?
The datasets used in this study are located in the `data/` directory.

### Who should I contact for questions?
For any inquiries, please contact Yong Kyun Kim at amoureuxyk@naver.com

