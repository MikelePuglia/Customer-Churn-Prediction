# ============================================
# 02_preprocessing.R
# ============================================
# Function: preprocess_data()
# Description:
#   Preprocesses the dataset:
#     - removes rows with NA
#     - converts categorical variables to factors using mutate()
# Input:
#   df - dataset
# Output:
#   preprocessed dataset
# ============================================

preprocess_data <- function(df) {
  if(!requireNamespace("dplyr", quietly = TRUE)) stop("Package 'dplyr' is required")
  library(dplyr)
  
  # Remove missing values
  df <- na.omit(df)
  
  # Convert categorical variables using mutate (pipe style like original)
  df <- df %>%
    mutate(
      churn = as.factor(churn),
      country = as.factor(country),
      gender = as.factor(gender),
      active_member = as.factor(active_member),
      credit_card = as.factor(credit_card)
    )
  
  cat("✅ Preprocessing completed\n")
  return(df)
}
