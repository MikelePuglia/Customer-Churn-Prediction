# ============================================
# main.R - Customer Churn ML Pipeline
# ============================================

# --------------------------------------------
# 0. Load required packages
# --------------------------------------------
library(dplyr)
library(ggplot2)
library(corrplot)
library(pROC)

# --------------------------------------------
# 1. Source all modules
# --------------------------------------------
source("01_load_data.R")
source("02_preprocessing.R")
source("03_eda.R")
source("04_glm_model.R")
source("05_evaluation.R")

# --------------------------------------------
# 2. Load dataset
# --------------------------------------------
df <- load_data("C:/Users/pugli/OneDrive/Desktop/Customer_Churn_Prediction/Bank Customer Churn Prediction.csv")

# --------------------------------------------
# 3. Preprocess data
# --------------------------------------------
df_clean <- preprocess_data(df)

# --------------------------------------------
# 4. Exploratory Data Analysis (EDA)
# --------------------------------------------
eda_summary(df_clean)
plot_churn_distribution(df_clean)

# --------------------------------------------
# 5. Train GLM model
# --------------------------------------------
glm_model <- train_glm(df_clean)

# --------------------------------------------
# 6. Evaluate model
# --------------------------------------------
results <- evaluate_model(glm_model, df_clean)

# Print confusion matrix and accuracy
cat("\n=== Confusion Matrix ===\n")
print(results$conf_matrix)
cat("Accuracy:", round(results$accuracy, 3), "\n")